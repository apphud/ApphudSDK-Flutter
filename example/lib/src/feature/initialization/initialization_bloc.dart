import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
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
  })   : _appSecrets = appSecrets,
        _navigationBloc = navigationBloc,
        super(InitializationState.trying()) {
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      final List<ApphudProduct> products =
          await AppHud.productsDidFetchCallback();
      add(InitializationEvent.productsFetchSuccess(products));
      printAsJson('productsDidFetchCallback()', products);
    } catch (e) {
      add(InitializationEvent.productsFetchFailure(e.toString()));
      printError('productsDidFetchCallback()', e);
    }

    final ApphudPaywalls apphudPaywalls =  await AppHud.getPaywalls();
    printAsJson('getPaywalls()', apphudPaywalls);
  }

  @override
  Stream<InitializationState> mapEventToState(
    InitializationEvent event,
  ) =>
      event.map(
        initializeTrying: _mapInitializeTrying,
        productsFetchFailure: _mapProductsFetchFailure,
        productsFetchSuccess: _mapProductsFetchSuccess,
      );

  Stream<InitializationState> _mapInitializeTrying(
      InitializeTrying value) async* {
    try {
      await AppHud.enableDebugLogs();
      await AppHud.startManually(
        apiKey: _appSecrets.apiKey,
        userID: _appSecrets.userID,
        deviceID: _appSecrets.deviceID,
        observerMode: _appSecrets.observeMode,
      );

      yield* state.maybeMap(
        orElse: () async* {},
        trying: (s) async* {
          if (s.isProductFetched) {
            yield InitializationState.success(products: s.products);
            _navigationBloc.add(NavigationEvent.toHome());
          } else {
            yield s.copyWith(isStartSuccess: true);
          }
        },
      );
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
        if (s.isStartSuccess) {
          yield InitializationState.success(products: event.products);
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
}
