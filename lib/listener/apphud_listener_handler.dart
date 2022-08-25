import 'dart:async';

import 'package:apphud/listener/apphud_listener.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:flutter/services.dart';
import 'package:apphud/models/extensions.dart';

class ApphudListenerHandler {
  late final MethodChannel _channel;
  late final ApphudListener _listener;

  ApphudListenerHandler({
    required MethodChannel channel,
    required ApphudListener listener,
  })  : _channel = channel,
        _listener = listener {
    _channel.setMethodCallHandler(_callHandler);
    _channel.invokeMethod('startListening');
  }

  Future<void> _callHandler(MethodCall call) async {
    switch (call.method) {
      case 'didChangeUserID':
        unawaited(_handleDidChangeUserID(call.arguments));
        break;

      case 'fetchNativeProducts':
        unawaited(_handleFetchNativeProducts(call.arguments));
        break;

      case 'paywallsDidFullyLoad':
        unawaited(_handlePaywallsDidFullyLoad(call.arguments));
        break;

      case 'userDidLoad':
        unawaited(_handleUserDidLoad(call.arguments));
        break;

      case 'apphudSubscriptionsUpdated':
        unawaited(_handleApphudSubscriptionsUpdated(call.arguments));
        break;

      case 'apphudNonRenewingPurchasesUpdated':
        unawaited(_handleApphudNonRenewingPurchasesUpdated(call.arguments));
        break;
    }
  }

  Future<void> _handleDidChangeUserID(dynamic arguments) async {
    final String userId = arguments as String;
    unawaited(_listener.apphudDidChangeUserID(userId));
  }

  Future<void> _handleFetchNativeProducts(dynamic arguments) async {
    List<Map<dynamic, dynamic>> productsMap =
        (arguments as List<dynamic>).toMapList;
    List<ApphudProductComposite> products = productsMap
        .map((json) => ApphudProductComposite.fromJson(json))
        .toList();
    unawaited(_listener.apphudDidFecthProducts(products));
  }

  Future<void> _handlePaywallsDidFullyLoad(dynamic arguments) async {
    final Map<dynamic, dynamic> map = arguments;
    unawaited(_listener.paywallsDidFullyLoad(ApphudPaywalls.fromJson(map)));
  }

  Future<void> _handleUserDidLoad(dynamic arguments) async {
    final Map<dynamic, dynamic> map = arguments;
    unawaited(_listener.userDidLoad(ApphudPaywalls.fromJson(map)));
  }

  Future<void> _handleApphudSubscriptionsUpdated(dynamic arguments) async {
    final List<Map<dynamic, dynamic>> subscriptionsMap =
        (arguments as List<dynamic>).toMapList;

    final List<ApphudSubscriptionWrapper> subscriptions = subscriptionsMap
        .map((json) => ApphudSubscriptionWrapper.fromJson(json))
        .toList();

    unawaited(_listener.apphudSubscriptionsUpdated(subscriptions));
  }

  Future<void> _handleApphudNonRenewingPurchasesUpdated(
      dynamic arguments) async {
    final List<Map<dynamic, dynamic>> purchasesMap =
        (arguments as List<dynamic>).toMapList;

    final List<ApphudNonRenewingPurchase> purchases = purchasesMap
        .map((json) => ApphudNonRenewingPurchase.fromJson(json))
        .toList();

    unawaited(_listener.apphudNonRenewingPurchasesUpdated(purchases));
  }

  void dispose() {
    _channel.invokeMethod('stopListening');
  }
}
