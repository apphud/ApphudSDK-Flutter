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
  static const String _idfa = 'custom_idfa_new';
  static const Map<String, dynamic> _attributionData = {
    'testAttribution': 'testValue',
  };
  static const ApphudAttributionProvider _attributionProvider =
      ApphudAttributionProvider.appleAdsAttribution;

  PurchaseBloc() : super(PurchaseState.init());

  @override
  Stream<PurchaseState> mapEventToState(
    PurchaseEvent event,
  ) =>
      event.map(
        restorePurchases: _mapRestorePurchases,
        purchaseProduct: _mapPurchaseProduct,
        paywallShown: _mapPaywallShown,
        paywallClosed: _mapPaywallClosed,
        grantPromotional: _mapGrantPromotional,
        syncPurchase: _mapSyncPurchase,
        callAll: _mapCallAll,
      );

  Stream<PurchaseState> _mapPurchaseProduct(PurchaseProduct event) async* {
    yield PurchaseState.inProgress();
    final subscriptionOfferDetails =
        event.product.productDetails?.subscriptionOfferDetails ?? [];
    final offerIdToken = subscriptionOfferDetails.isEmpty
        ? null
        : subscriptionOfferDetails.first.offerToken;
    final ApphudPurchaseResult result = await Apphud.purchase(
      productId: event.product.productId,
      // or we can use
      // product: event.product,
      offerIdToken: offerIdToken,
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
    printAsJson('try to restore purchases', '');
    final ApphudComposite result = await Apphud.restorePurchases();
    printAsJson('restorePurchases()', result);
    if (result.error == null) {
      yield PurchaseState.restorePurchasesSuccess();
    } else {
      yield PurchaseState.restorePurchaseFailure(result.error!);
    }
  }

  Stream<PurchaseState> _mapPaywallShown(PaywallShown event) async* {
    unawaited(Apphud.paywallShown(event.paywall).then(
      (value) => printAsJson(
        'paywallShown(${event.paywall.identifier})',
        'success',
      ),
      onError: (e) => printError(
        'paywallShown(${event.paywall.identifier})',
        e,
      ),
    ));
  }

  Stream<PurchaseState> _mapPaywallClosed(PaywallClosed event) async* {
    unawaited(Apphud.paywallClosed(event.paywall).then(
      (value) => printAsJson(
        'paywallClosed(${event.paywall.identifier})',
        'success',
      ),
      onError: (e) => printError(
        'paywallClosed(${event.paywall.identifier})',
        e,
      ),
    ));
  }

  Stream<PurchaseState> _mapGrantPromotional(GrantPromotional event) async* {
    unawaited(Apphud.grantPromotional(
      daysCount: 1,
      productId: event.product.productId,
    ).then(
      (value) => printAsJson(
        'grantPromotional(${event.product.productId})',
        '$value',
      ),
      onError: (e) => printError(
        'grantPromotional(${event.product.productId})',
        e,
      ),
    ));
  }

  Stream<PurchaseState> _mapSyncPurchase(SyncPurchase event) async* {
    unawaited(Apphud.syncPurchasesInObserverMode().then(
      (value) => printAsJson(
        'syncPurchases()',
        'success',
      ),
      onError: (e) => printError(
        'syncPurchases()',
        e,
      ),
    ));
  }

  Stream<PurchaseState> _mapCallAll(CallAll event) async* {
    Apphud.hasActiveSubscription().then(
      (value) => printAsJson('hasActiveSubscription()', value),
      onError: (e) => printError('hasActiveSubscription()', e),
    );

    // Apphud.subscription().then(
    //   (value) => printAsJson('subscription()', value),
    //   onError: (e) => printError('subscription()', e),
    // );
    //
    // Apphud.subscriptions().then(
    //   (value) => printAsJson('subscriptions()', value),
    //   onError: (e) => printError('subscriptions()', e),
    // );
    //
    // Apphud.nonRenewingPurchases().then(
    //   (value) => printAsJson('nonRenewingPurchases()', value),
    //   onError: (e) => printError('nonRenewingPurchases()', e),
    // );
    //
    // Apphud.hasPremiumAccess().then(
    //   (value) => printAsJson('hasPremiumAccess()', value),
    //   onError: (e) => printError('hasPremiumAccess()', e),
    // );
    //
    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.name,
    //   value: _nameParameterValue,
    // );
    // printAsJson(
    //   'setUserProperty(name)',
    //   _nameParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.email,
    //   value: _emailParameterValue,
    // );
    // printAsJson(
    //   'setUserProperty(email)',
    //   _emailParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.phone,
    //   value: _phoneParameterValue,
    // );
    // printAsJson(
    //   'setUserProperty(phone)',
    //   _phoneParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.age,
    //   value: _ageParameterValue,
    // );
    // printAsJson(
    //   'setUserProperty(age)',
    //   _ageParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.gender,
    //   value: _genderParameterValue,
    // );
    // printAsJson(
    //   'setUserProperty(gender)',
    //   _genderParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.customProperty(_customParameterName),
    //   value: _customParameterValue,
    // );
    // printAsJson(
    //   'setUserProperty(customProperty($_customParameterName))',
    //   _customParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // await Apphud.incrementUserProperty(
    //   key: ApphudUserPropertyKey.age,
    //   by: _ageIncreaseParameterValue,
    // );
    // printAsJson(
    //   'incrementUserProperty(age)',
    //   _ageIncreaseParameterValue,
    //   printOnlyMethodName: true,
    // );
    //
    // Apphud.addAttribution(
    //   data: _attributionData,
    //   provider: _attributionProvider,
    // ).then(
    //   (value) => printAsJson(
    //     'Parameters and the result of _setAttribution()',
    //     <String, dynamic>{
    //       'parameters': <String, dynamic>{
    //         'data': _attributionData,
    //         'provider': _attributionProvider.convertToString,
    //       },
    //       'result': value,
    //     },
    //     printOnlyMethodName: true,
    //   ),
    //   onError: (e) => printError('_setAttribution()', e),
    // );
    //
    // Apphud.collectSearchAdsAttribution().then(
    //   (value) => printAsJson(
    //     'collectSearchAdsAttribution()',
    //     value ?? 'Ok',
    //   ),
    //   onError: (e) => printError('collectSearchAdsAttribution()', e),
    // );
    //
    // Apphud.permissionGroups().then(
    //   (value) => printAsJson('permissionGroups()', value),
    //   onError: (e) => printError('permissionGroups()', e),
    // );
    //
    // Apphud.paywalls().then(
    //   (value) => printAsJson(
    //     'paywalls',
    //     value,
    //   ),
    //   onError: (e) => printError('paywalls', e),
    // );
    //
    // Apphud.deviceID().then(
    //   (value) => printAsJson(
    //     'deviceID',
    //     value,
    //   ),
    //   onError: (e) => printError('deviceID', e),
    // );
    //
    // Apphud.setAdvertisingIdentifier(_idfa).then(
    //   (value) => printAsJson(
    //     'setAdvertisingIdentifier',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('setAdvertisingIdentifier', e),
    // );
    //
    // Apphud.updateUserID('userID').then(
    //   (value) => printAsJson(
    //     'updateUserID',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('updateUserID', e),
    // );
    //
    // Apphud.userID().then(
    //   (value) => printAsJson(
    //     'userID',
    //     value,
    //   ),
    //   onError: (e) => printError('userID', e),
    // );
    //
    // Apphud.logout().then(
    //   (value) => printAsJson(
    //     'logout',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('logout', e),
    // );
    //
    // Apphud.product('productIdentifier').then(
    //   (value) => printAsJson(
    //     'product',
    //     value,
    //   ),
    //   onError: (e) => printError('product', e),
    // );
    //
    // Apphud.products().then(
    //   (value) => printAsJson(
    //     'products',
    //     value,
    //   ),
    //   onError: (e) => printError('products', e),
    // );
    //
    // Apphud.purchasePromo(
    //   productId: 'productId',
    //   discountID: 'discountID',
    // ).then(
    //   (value) => printAsJson(
    //     'purchasePromo',
    //     value,
    //   ),
    //   onError: (e) => printError('purchasePromo', e),
    // );
    //
    // Apphud.presentOfferCodeRedemptionSheet().then(
    //   (value) => printAsJson(
    //     'presentOfferCodeRedemptionSheet',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('presentOfferCodeRedemptionSheet', e),
    // );
    //
    // Apphud.isNonRenewingPurchaseActive('productIdentifier').then(
    //   (value) => printAsJson(
    //     'isNonRenewingPurchaseActive()',
    //     value,
    //   ),
    //   onError: (e) => printError('isNonRenewingPurchaseActive()', e),
    // );
    //
    // Apphud.restorePurchases().then(
    //   (value) => printAsJson(
    //     'restorePurchases',
    //     value,
    //   ),
    //   onError: (e) => printError('restorePurchases', e),
    // );
    //
    // Apphud.syncPurchasesInObserverMode().then(
    //   (value) => printAsJson(
    //     'syncPurchasesInObserverMode',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('syncPurchasesInObserverMode', e),
    // );
    //
    // Apphud.enableDebugLogs().then(
    //   (value) => printAsJson(
    //     'enableDebugLogs',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('enableDebugLogs', e),
    // );
    //
    // Apphud.paywallShown(paywall).then(
    //   (value) => printAsJson(
    //     'paywallShown',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('paywallShown', e),
    // );
    //
    // Apphud.paywallClosed(paywall).then(
    //   (value) => printAsJson(
    //     'paywallClosed',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('paywallClosed', e),
    // );
    //
    // Apphud.optOutOfTracking().then(
    //   (value) => printAsJson(
    //     'optOutOfTracking',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('optOutOfTracking', e),
    // );
    //
    // Apphud.collectDeviceIdentifiers().then(
    //   (value) => printAsJson(
    //     'collectDeviceIdentifiers',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('collectDeviceIdentifiers', e),
    // );
    //
    // Apphud.grantPromotional(daysCount: 1).then(
    //   (value) => printAsJson(
    //     'grantPromotional',
    //     value,
    //   ),
    //   onError: (e) => printError('grantPromotional', e),
    // );
    Apphud.paywallsDidLoadCallback().then(
      (value) => printAsJson(
        'paywallsDidLoadCallback',
        value,
      ),
      onError: (e) => printError('paywallsDidLoadCallback', e),
    );
  }
}
