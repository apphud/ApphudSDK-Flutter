import 'dart:async';

import 'package:apphud/listener/apphud_rule_listener.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/apphud_models/apphud_rule.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';
import 'package:flutter/services.dart';

class ApphudRuleListenerHandler {
  late final MethodChannel _channel;
  late final ApphudRuleListener _listener;

  ApphudRuleListenerHandler({
    required MethodChannel channel,
    required ApphudRuleListener listener,
  })  : _channel = channel,
        _listener = listener {
    _channel.setMethodCallHandler(_callHandler);
    _channel.invokeMethod('startListening');
  }

  Future<void> _callHandler(MethodCall call) async {
    switch (call.method) {
      case 'apphudRuleScreenDidAppear':
        unawaited(_handleScreenDidAppear(call.arguments));
        break;
      case 'apphudRuleWillPurchase':
        unawaited(_handleWillPurchase(call.arguments));
        break;
      case 'apphudRulePurchaseCompleted':
        unawaited(_handlePurchaseCompleted(call.arguments));
        break;
      case 'apphudRuleScreenWillDismiss':
        unawaited(_handleScreenWillDismiss(call.arguments));
        break;
      case 'apphudRuleScreenDidDismiss':
        unawaited(_handleScreenDidDismiss(call.arguments));
        break;
      case 'apphudRuleDidSelectSurveyAnswer':
        unawaited(_handleSurveyAnswer(call.arguments));
        break;
      case 'apphudRulePaywallWithoutScreen':
        unawaited(_handlePaywallWithoutScreen(call.arguments));
        break;
    }
  }

  ApphudRule _ruleFrom(dynamic arguments) {
    final map = arguments as Map<dynamic, dynamic>;
    final ruleMap = map['rule'];
    if (ruleMap is Map) {
      return ApphudRule.fromJson(Map<dynamic, dynamic>.from(ruleMap));
    }
    return ApphudRule.fromJson(map);
  }

  Future<void> _handleScreenDidAppear(dynamic arguments) async {
    unawaited(_listener.apphudRuleScreenDidAppear(_ruleFrom(arguments)));
  }

  Future<void> _handleWillPurchase(dynamic arguments) async {
    final map = arguments as Map<dynamic, dynamic>;
    final rule = _ruleFrom(map);
    final productMap = map['product'];
    final product = productMap is Map
        ? ApphudProduct.fromJson(Map<dynamic, dynamic>.from(productMap))
        : null;
    unawaited(_listener.apphudRuleWillPurchase(rule, product));
  }

  Future<void> _handlePurchaseCompleted(dynamic arguments) async {
    final map = arguments as Map<dynamic, dynamic>;
    final rule = _ruleFrom(map);
    final resultMap = map['result'];
    final result = resultMap is Map
        ? ApphudPurchaseResult.fromJson(Map<dynamic, dynamic>.from(resultMap))
        : ApphudPurchaseResult();
    unawaited(_listener.apphudRulePurchaseCompleted(rule, result));
  }

  Future<void> _handleScreenWillDismiss(dynamic arguments) async {
    final map = arguments as Map<dynamic, dynamic>;
    final rule = _ruleFrom(map);
    final error = map['error'] as String?;
    unawaited(_listener.apphudRuleScreenWillDismiss(rule, error));
  }

  Future<void> _handleScreenDidDismiss(dynamic arguments) async {
    unawaited(_listener.apphudRuleScreenDidDismiss(_ruleFrom(arguments)));
  }

  Future<void> _handleSurveyAnswer(dynamic arguments) async {
    final map = arguments as Map<dynamic, dynamic>;
    final rule = _ruleFrom(map);
    final question = (map['question'] as String?) ?? '';
    final answer = (map['answer'] as String?) ?? '';
    unawaited(
      _listener.apphudRuleDidSelectSurveyAnswer(rule, question, answer),
    );
  }

  Future<void> _handlePaywallWithoutScreen(dynamic arguments) async {
    final map = arguments as Map<dynamic, dynamic>;
    final rule = _ruleFrom(map);
    final paywallMap = map['paywall'];
    if (paywallMap is! Map) {
      return;
    }
    final paywall =
        ApphudPaywall.fromJson(Map<dynamic, dynamic>.from(paywallMap));
    unawaited(_listener.apphudRulePaywallWithoutScreen(rule, paywall));
  }

  void dispose() {
    _channel.invokeMethod('stopListening');
    _channel.setMethodCallHandler(null);
  }
}
