import 'dart:async';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';
import 'package:apphud_example/src/feature/common/debug_print_mixin.dart';
import 'package:bloc/bloc.dart';
import 'purchase_event.dart';
import 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState>
    with DebugPrintMixin {
  static const String _nameParameterValue = 'SomeUserName1';
  static const String _emailParameterValue = 'mail1@site.com';
  static const String _phoneParameterValue = '1213141516';
  static const int _ageParameterValue = 40;
  static const int _ageIncreaseParameterValue = 1;
  static const String _genderParameterValue = 'male';
  static const String _customParameterName = 'new_some_custom_property';
  static const String _customParameterValue = 'new custom value';
  static const Map<String, dynamic> _attributionData = {
    'testAttribution': 'testValue',
  };
  static const ApphudAttributionProvider _attributionProvider =
      ApphudAttributionProvider.appsFlyer;

  PurchaseBloc() : super(PurchaseState.init()) {
    _fetchSubscriptions();
    _setUserProperties();
    _setAttribution();
  }

  @override
  Stream<PurchaseState> mapEventToState(
    PurchaseEvent event,
  ) =>
      event.map(
        purchase: _mapPurchase,
        restorePurchases: _mapRestorePurchases,
      );

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

  void _setUserProperties() async {
    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.name,
      value: _nameParameterValue,
    );
    printAsJson(
      'setUserProperty(name)',
      _nameParameterValue,
      printOnlyMethodName: true,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.email,
      value: _emailParameterValue,
    );
    printAsJson(
      'setUserProperty(email)',
      _emailParameterValue,
      printOnlyMethodName: true,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.phone,
      value: _phoneParameterValue,
    );
    printAsJson(
      'setUserProperty(phone)',
      _phoneParameterValue,
      printOnlyMethodName: true,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.age,
      value: _ageParameterValue,
    );
    printAsJson(
      'setUserProperty(age)',
      _ageParameterValue,
      printOnlyMethodName: true,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.gender,
      value: _genderParameterValue,
    );
    printAsJson(
      'setUserProperty(gender)',
      _genderParameterValue,
      printOnlyMethodName: true,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.customProperty(_customParameterName),
      value: _customParameterValue,
    );
    printAsJson(
      'setUserProperty(customProperty($_customParameterName))',
      _customParameterValue,
      printOnlyMethodName: true,
    );

    await Future.delayed(Duration(seconds: 2));
    await AppHud.incrementUserProperty(
      key: ApphudUserPropertyKey.age,
      by: _ageIncreaseParameterValue,
    );
    printAsJson(
      'incrementUserProperty(age)',
      _ageIncreaseParameterValue,
      printOnlyMethodName: true,
    );
  }

  void _setAttribution() {
    AppHud.addAttribution(
      data: _attributionData,
      provider: _attributionProvider,
    ).then(
      (value) => printAsJson(
        'Parameters and the result of _setAttribution()',
        <String, dynamic>{
          'parameters': <String, dynamic>{
            'data': _attributionData,
            'provider': _attributionProvider.convertToString,
          },
          'result': value,
        },
        printOnlyMethodName: true,
      ),
      onError: (e) => printError('_setAttribution()', e),
    );
  }

  Stream<PurchaseState> _mapPurchase(Purchase event) async* {
    yield PurchaseState.inProgress();
    final ApphudPurchaseResult result = await AppHud.purchase(event.id);
    printAsJson('purchase(${event.id})', result);
    if (result.error == null) {
      yield PurchaseState.purchaseSuccess();
    } else {
      yield PurchaseState.purchaseFailure(result.error!);
    }
  }

  Stream<PurchaseState> _mapRestorePurchases(RestorePurchases value) async* {
    yield PurchaseState.inProgress();
    final ApphudComposite result = await AppHud.restorePurchases();
    printAsJson('restorePurchases()', result);
    if (result.error == null) {
      yield PurchaseState.restorePurchasesSuccess();
    } else {
      yield PurchaseState.restorePurchaseFailure(result.error!);
    }
  }
}
