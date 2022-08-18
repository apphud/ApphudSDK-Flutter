import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_debug_level.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:apphud_example/src/feature/common/app_secrets_base.dart';
import 'package:apphud_example/src/feature/common/debug_print_mixin.dart';
import 'package:apphud_example/src/feature/navigation/navigation_bloc.dart';
import 'package:apphud_example/src/feature/navigation/navigation_event.dart';
import 'package:bloc/bloc.dart';

import 'initialization_event.dart';
import 'initialization_state.dart';

class InitializationBloc extends Bloc<InitializationEvent, InitializationState>
    with DebugPrintMixin
    implements ApphudListener {
  final AppSecretsBase _appSecrets;
  final NavigationBloc _navigationBloc;

  InitializationBloc({
    required AppSecretsBase appSecrets,
    required NavigationBloc navigationBloc,
  })  : _appSecrets = appSecrets,
        _navigationBloc = navigationBloc,
        super(InitializationState.trying());

  void _fetchPaywalls() async {
    unawaited(Apphud.setListener(listener: this));
  }

  @override
  Stream<InitializationState> mapEventToState(
    InitializationEvent event,
  ) =>
      event.map(
        initializeTrying: _mapInitializeTrying,
        paywallsFetchSuccess: _mapPaywallsFetchSuccess,
      );

  Stream<InitializationState> _mapInitializeTrying(
      InitializeTrying value) async* {
    try {
      await Apphud.enableDebugLogs(level: ApphudDebugLevel.high);
      await Apphud.startManually(
        apiKey: _appSecrets.apiKey,
        userID: _appSecrets.userID,
        deviceID: _appSecrets.deviceID,
        observerMode: _appSecrets.observeMode,
      );

      yield* state.maybeMap(
        orElse: () async* {},
        trying: (s) async* {
          yield s.copyWith(isStartSuccess: true);
        },
      );

      _fetchPaywalls();
    } catch (e) {
      yield InitializationState.startFail(e.toString());
    }
  }

  Stream<InitializationState> _mapPaywallsFetchSuccess(
      PaywallsFetchSuccess event) async* {
    yield* state.maybeMap(
      orElse: () async* {},
      trying: (s) async* {
        if (s.isStartSuccess) {
          yield InitializationState.success(
            paywalls: event.paywalls,
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

  @override
  Future<void> apphudDidChangeUserID(String userId) async {
    printAsJson('ApphudListener.apphudDidChangeUserID', userId);
  }

  @override
  Future<void> apphudDidFecthProducts(
    List<ApphudProductComposite> products,
  ) async {
    printAsJson('ApphudListener.apphudDidFecthProducts', products);
  }

  @override
  Future<void> paywallsDidFullyLoad(ApphudPaywalls paywalls) async {
    printAsJson('ApphudListener.paywallsDidFullyLoad', paywalls);
    add(InitializationEvent.paywallsFetchSuccess(paywalls));
  }

  @override
  Future<void> userDidLoad(ApphudPaywalls paywalls) async {
    printAsJson('ApphudListener.userDidLoad', paywalls);
  }

  @override
  Future<void> apphudNonRenewingPurchasesUpdated(
    List<ApphudNonRenewingPurchase> purchases,
  ) async {
    printAsJson('ApphudListener.apphudNonRenewingPurchasesUpdated', purchases);
  }

  @override
  Future<void> apphudSubscriptionsUpdated(
    List<ApphudSubscriptionWrapper> subscriptions,
  ) async {
    printAsJson('ApphudListener.apphudSubscriptionsUpdated', subscriptions);
  }
}
