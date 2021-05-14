import 'dart:async';
import 'package:apphud/apphud.dart';
import 'package:apphud_example/src/feature/common/debug_print_mixin.dart';
import 'package:bloc/bloc.dart';
import 'purchase_event.dart';
import 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState>
    with DebugPrintMixin {
  PurchaseBloc() : super(PurchaseState.init()) {
    _fetchSubscriptions();
  }

  @override
  Stream<PurchaseState> mapEventToState(
    PurchaseEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  void _fetchSubscriptions() {
    AppHud.hasActiveSubscription().then(
      (value) => printAsJson('hasActiveSubscription()', value),
      onError: (e) => printError('hasActiveSubscription()', e),
    );

    AppHud.subscription().then(
      (value) => printAsJson('subscription()', value),
      onError: (e) => printError('subscription()', e),
    );

    AppHud.subscriptions().then(
      (value) => printAsJson('subscriptions()', value),
      onError: (e) => printError('subscriptions()', e),
    );

    AppHud.nonRenewingPurchases().then(
      (value) => printAsJson('nonRenewingPurchases()', value),
      onError: (e) => printError('nonRenewingPurchases()', e),
    );
  }
}
