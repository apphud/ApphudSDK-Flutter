import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:apphud_example/src/feature/common/app_secrets_base.dart';
import 'package:apphud_example/src/feature/common/json_print_mixin.dart';
import 'package:apphud_example/src/feature/navigation/navigation_bloc.dart';
import 'package:apphud_example/src/feature/navigation/navigation_event.dart';
import 'package:bloc/bloc.dart';

import 'start_event.dart';
import 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> with DebugPrintMixin {
  final AppSecretsBase _appSecrets;
  final NavigationBloc _navigationBloc;

  StartBloc({
    required AppSecretsBase appSecrets,
    required NavigationBloc navigationBloc,
  })   : _appSecrets = appSecrets,
        _navigationBloc = navigationBloc,
        super(StartState.trying()) {
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      final List<ApphudProduct> products =
          await AppHud.productsDidFetchCallback();
      add(StartEvent.productsFetchSuccess(products));
      printAsJson('productsDidFetchCallback()', products);
    } catch (e) {
      add(StartEvent.productsFetchFailure(e.toString()));
      printError('productsDidFetchCallback()', e);
    }
  }

  @override
  Stream<StartState> mapEventToState(
    StartEvent event,
  ) =>
      event.map(
        tryToStart: _mapTryToStart,
        productsFetchFailure: _mapProductsFetchFailure,
        productsFetchSuccess: _mapProductsFetchSuccess,
      );

  Stream<StartState> _mapTryToStart(TryToStart value) async* {
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
            yield StartState.success(products: s.products);
            _navigationBloc.add(NavigationEvent.toHome());
          }
          yield s.copyWith(isStartSuccess: true);
        },
      );
    } catch (e) {
      yield StartState.startFail(e.toString());
    }
  }

  Stream<StartState> _mapProductsFetchFailure(
      ProductsFetchFailure event) async* {
    yield StartState.productsFetchFail(event.error);
  }

  Stream<StartState> _mapProductsFetchSuccess(
      ProductsFetchSuccess event) async* {
    yield* state.maybeMap(
      orElse: () async* {},
      trying: (s) async* {
        if (s.isStartSuccess) {
          yield StartState.success(products: event.products);
          _navigationBloc.add(NavigationEvent.toHome());
        }
        yield s.copyWith(
          isProductFetched: true,
          products: event.products,
        );
      },
    );
  }
}
