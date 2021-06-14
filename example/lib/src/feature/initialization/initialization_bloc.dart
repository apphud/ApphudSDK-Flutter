import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:apphud_example/src/feature/common/app_secrets_base.dart';
import 'package:apphud_example/src/feature/common/debug_print_mixin.dart';
import 'package:apphud_example/src/feature/navigation/navigation_bloc.dart';
import 'package:apphud_example/src/feature/navigation/navigation_event.dart';
import 'package:bloc/bloc.dart';

import 'initialization_event.dart';
import 'initialization_state.dart';

class InitializationBloc extends Bloc<InitializationEvent, InitializationState>
    with DebugPrintMixin {
  final AppSecretsBase _appSecrets;
  final NavigationBloc _navigationBloc;

  InitializationBloc({
    required AppSecretsBase appSecrets,
    required NavigationBloc navigationBloc,
  })  : _appSecrets = appSecrets,
        _navigationBloc = navigationBloc,
        super(InitializationState.trying()) {
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      final List<ApphudProductComposite> products =
          await Apphud.productsDidFetchCallback();
      add(InitializationEvent.productsFetchSuccess(products));
      printAsJson('productsDidFetchCallback()', products);
    } catch (e) {
      add(InitializationEvent.productsFetchFailure(e.toString()));
      printError('productsDidFetchCallback()', e);
    }
  }

  void _fetchPaywalls() async {
    try {
      final ApphudPaywalls paywalls = await Apphud.getPaywalls();
      add(InitializationEvent.paywallsFetchSuccess(paywalls));
      printAsJson('getPaywalls()', paywalls);
    } catch (e) {
      add(InitializationEvent.paywallsFetchFailure(e.toString()));
      printError('getPaywalls()', e);
    }
  }

  @override
  Stream<InitializationState> mapEventToState(
    InitializationEvent event,
  ) =>
      event.map(
        initializeTrying: _mapInitializeTrying,
        productsFetchFailure: _mapProductsFetchFailure,
        productsFetchSuccess: _mapProductsFetchSuccess,
        paywallsFetchFailure: _mapPaywallsFetchFailure,
        paywallsFetchSuccess: _mapPaywallsFetchSuccess,
      );

  Stream<InitializationState> _mapInitializeTrying(
      InitializeTrying value) async* {
    try {
      await Apphud.enableDebugLogs();
      await Apphud.startManually(
        apiKey: _appSecrets.apiKey,
        userID: _appSecrets.userID,
        deviceID: _appSecrets.deviceID,
        observerMode: _appSecrets.observeMode,
      );

      yield* state.maybeMap(
        orElse: () async* {},
        trying: (s) async* {
          if (s.isProductFetched && s.isPaywallsFetched) {
            yield InitializationState.success(products: s.products);
            _navigationBloc.add(NavigationEvent.toHome());
          } else {
            yield s.copyWith(isStartSuccess: true);
          }
        },
      );

      _fetchPaywalls();
    } catch (e) {
      yield InitializationState.startFail(e.toString());
    }
  }

  Stream<InitializationState> _mapProductsFetchFailure(
      ProductsFetchFailure event) async* {
    yield InitializationState.productsFetchFail(event.error);
  }

  Stream<InitializationState> _mapProductsFetchSuccess(
      ProductsFetchSuccess event) async* {
    yield* state.maybeMap(
      orElse: () async* {},
      trying: (s) async* {
        if (s.isStartSuccess && s.isPaywallsFetched) {
          yield InitializationState.success(
            products: event.products,
            paywalls: s.paywalls,
          );
          _navigationBloc.add(NavigationEvent.toHome());
        } else {
          yield s.copyWith(
            isProductFetched: true,
            products: event.products,
          );
        }
      },
    );
  }

  Stream<InitializationState> _mapPaywallsFetchFailure(
      PaywallsFetchFailure event) async* {
    yield InitializationState.paywallsFetchFail(event.error);
  }

  Stream<InitializationState> _mapPaywallsFetchSuccess(
      PaywallsFetchSuccess event) async* {
    yield* state.maybeMap(
      orElse: () async* {},
      trying: (s) async* {
        if (s.isStartSuccess && s.isProductFetched) {
          yield InitializationState.success(
            paywalls: event.paywalls,
            products: s.products,
          );
          _navigationBloc.add(NavigationEvent.toHome());
        } else {
          yield s.copyWith(
            isPaywallsFetched: true,
            paywalls: event.paywalls,
          );
        }
      },
    );
  }
}
