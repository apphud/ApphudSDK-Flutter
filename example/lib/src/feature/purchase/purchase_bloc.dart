import 'dart:async';
import 'dart:io';
import 'package:apphud/apphud.dart';
import 'package:pedantic/pedantic.dart';
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
    _collectSearchAdsAttribution();
    _fetchPermissionGroups();
  }

  @override
  Stream<PurchaseState> mapEventToState(
    PurchaseEvent event,
  ) =>
      event.map(
        purchase: _mapPurchase,
        restorePurchases: _mapRestorePurchases,
        purchaseProduct: _mapPurchaseProduct,
        paywallShown: _mapPaywallShown,
        paywallClosed: _mapPaywallClosed,
      );

  void _fetchSubscriptions() {
    Apphud.hasActiveSubscription().then(
      (value) => printAsJson('hasActiveSubscription()', value),
      onError: (e) => printError('hasActiveSubscription()', e),
    );

    Apphud.subscription().then(
      (value) => printAsJson('subscription()', value),
      onError: (e) => printError('subscription()', e),
    );

    Apphud.subscriptions().then(
      (value) => printAsJson('subscriptions()', value),
      onError: (e) => printError('subscriptions()', e),
    );

    Apphud.nonRenewingPurchases().then(
      (value) => printAsJson('nonRenewingPurchases()', value),
      onError: (e) => printError('nonRenewingPurchases()', e),
    );
  }

  void _setUserProperties() async {
    await Apphud.setUserProperty(
      key: ApphudUserPropertyKey.name,
      value: _nameParameterValue,
    );
    printAsJson(
      'setUserProperty(name)',
      _nameParameterValue,
      printOnlyMethodName: true,
    );

    await Apphud.setUserProperty(
      key: ApphudUserPropertyKey.email,
      value: _emailParameterValue,
    );
    printAsJson(
      'setUserProperty(email)',
      _emailParameterValue,
      printOnlyMethodName: true,
    );

    await Apphud.setUserProperty(
      key: ApphudUserPropertyKey.phone,
      value: _phoneParameterValue,
    );
    printAsJson(
      'setUserProperty(phone)',
      _phoneParameterValue,
      printOnlyMethodName: true,
    );

    await Apphud.setUserProperty(
      key: ApphudUserPropertyKey.age,
      value: _ageParameterValue,
    );
    printAsJson(
      'setUserProperty(age)',
      _ageParameterValue,
      printOnlyMethodName: true,
    );

    await Apphud.setUserProperty(
      key: ApphudUserPropertyKey.gender,
      value: _genderParameterValue,
    );
    printAsJson(
      'setUserProperty(gender)',
      _genderParameterValue,
      printOnlyMethodName: true,
    );

    await Apphud.setUserProperty(
      key: ApphudUserPropertyKey.customProperty(_customParameterName),
      value: _customParameterValue,
    );
    printAsJson(
      'setUserProperty(customProperty($_customParameterName))',
      _customParameterValue,
      printOnlyMethodName: true,
    );

    await Future.delayed(Duration(seconds: 2));
    await Apphud.incrementUserProperty(
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
    Apphud.addAttribution(
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

  void _collectSearchAdsAttribution() {
    Apphud.collectSearchAdsAttribution().then(
      (value) => printAsJson(
        'collectSearchAdsAttribution()',
        value ?? 'Ok',
      ),
      onError: (e) => printError('collectSearchAdsAttribution()', e),
    );
  }

  void _fetchPermissionGroups() {
    Apphud.permissionGroups().then(
      (value) => printAsJson('permissionGroups()', value),
      onError: (e) => printError('permissionGroups()', e),
    );
  }

  Stream<PurchaseState> _mapPurchase(Purchase event) async* {
    yield PurchaseState.inProgress();
    final ApphudPurchaseResult result = await Apphud.purchase(
      productId: event.id,
    );
    printAsJson('purchase(${event.id})', result);
    if (result.error == null) {
      yield PurchaseState.purchaseSuccess();
    } else {
      yield PurchaseState.purchaseFailure(result.error!);
    }
  }

  Stream<PurchaseState> _mapPurchaseProduct(PurchaseProduct event) async* {
    yield PurchaseState.inProgress();
    final ApphudPurchaseResult result = await Apphud.purchase(
      product: event.product,
    );
    printAsJson('purchaseProduct(${event.product.productId})', result);
    if (result.error == null) {
      yield PurchaseState.purchaseSuccess();
    } else {
      yield PurchaseState.purchaseFailure(result.error!);
    }
  }

  Stream<PurchaseState> _mapRestorePurchases(RestorePurchases value) async* {
    yield PurchaseState.inProgress();
    final ApphudComposite result = await Apphud.restorePurchases();
    printAsJson('restorePurchases()', result);
    if (result.error == null) {
      yield PurchaseState.restorePurchasesSuccess();
    } else {
      yield PurchaseState.restorePurchaseFailure(result.error!);
    }
  }

  Stream<PurchaseState> _mapPaywallShown(PaywallShown event) async* {
    if (Platform.isIOS) {
      unawaited(Apphud.paywallShown(event.paywall));
    }
  }

  Stream<PurchaseState> _mapPaywallClosed(PaywallClosed event) async* {
    if (Platform.isIOS) {
      unawaited(Apphud.paywallClosed(event.paywall));
    }
  }
}
