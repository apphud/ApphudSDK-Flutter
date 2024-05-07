import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_debug_level.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:apphud_example/src/common/app_secrets_base.dart';
import 'package:apphud_example/src/common/debug_print_mixin.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_user_message.dart';
import 'package:bloc/bloc.dart';

import 'purchase_event.dart';
export 'purchase_event.dart';

import 'purchase_state.dart';
export 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState>
    with DebugPrintMixin
    implements ApphudListener {
  final AppSecretsBase _appSecrets;

  PurchaseBloc({
    required AppSecretsBase appSecrets,
  })  : _appSecrets = appSecrets,
        super(PurchaseState.initialization()) {
    on<PurchaseEvent>(_handlePurchaseEvent);
    Apphud.setListener(listener: this);
  }

  Future<void> _handlePurchaseEvent(
    PurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    await event.map(
      started: (e) => _handleStartedEvent(e, emit),
      paywallsFetched: (e) => _handlePaywallsFetchedEvent(e, emit),
      placementsFetched: (e) => _handlePlacementsFetchedEvent(e, emit),
      callAll: (e) => _handleCallAllEvent(e, emit),
      grantPromotional: (e) => _handleGrantPromotionalEvent(e, emit),
      paywallClosed: (e) => _handlePaywallClosedEvent(e, emit),
      paywallShown: (e) => _handlePaywallShownEvent(e, emit),
      purchaseProduct: (e) => _handlePurchaseProductEvent(e, emit),
      restorePurchases: (e) => _handleRestorePurchasesEvent(e, emit),
      syncPurchase: (e) => _handleSyncPurchaseEvent(e, emit),
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
    printAsJson('ApphudListener.apphudDidFetchProducts', products);
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

  @override
  Future<void> paywallsDidFullyLoad(ApphudPaywalls paywalls) async {
    printAsJson('ApphudListener.paywallsDidFullyLoad', paywalls);
    add(PurchaseEvent.paywallsFetched(paywalls));
  }

  @override
  Future<void> placementsDidFullyLoad(List<ApphudPlacement> placements) async {
    printAsJson('ApphudListener.placementsDidFullyLoad', placements);
    add(PurchaseEvent.placementsFetched(placements));
  }

  @override
  Future<void> userDidLoad(ApphudUser user) async {
    printAsJson('ApphudListener.userDidLoad', user);
  }

  Future<void> _handleStartedEvent(
    PurchaseStartedEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await Apphud.enableDebugLogs(level: ApphudDebugLevel.high);

      final user = await Apphud.start(
        apiKey: _appSecrets.apiKey,
        userID: _appSecrets.userID,
        observerMode: _appSecrets.observeMode,
      );
      printAsJson('user', user);
      emit(PurchaseState.initialization(isStartSuccess: true));
    } catch (error) {
      emit(PurchaseState.startFailed(error.toString()));
    }
  }

  Future<void> _handlePaywallsFetchedEvent(
    PurchasePaywallsFetchedEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    state.mapOrNull(
      initialization: (s) {
        if (s.isStartSuccess && s.isPlacementsFetched) {
          emit(PurchaseState.success(
            placements: s.placements,
            paywalls: event.paywalls,
          ));
        } else {
          emit(s.copyWith(
            isPaywallsFetched: true,
            paywalls: event.paywalls,
          ));
        }
      },
      success: (s) {
        emit(s.copyWith(
          paywalls: event.paywalls,
        ));
      },
    );
  }

  Future<void> _handlePlacementsFetchedEvent(
    PurchasePlacementsFetchedEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    state.mapOrNull(
      initialization: (s) {
        if (s.isStartSuccess && s.isPaywallsFetched) {
          emit(PurchaseState.success(
            placements: event.placements,
            paywalls: s.paywalls,
          ));
        } else {
          emit(s.copyWith(
            isPlacementsFetched: true,
            placements: event.placements,
          ));
        }
      },
      success: (s) {
        emit(s.copyWith(placements: event.placements));
      },
    );
  }

  Future<void> _handleGrantPromotionalEvent(
    PurchaseGrantPromotionalEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    Apphud.grantPromotional(
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
    );
  }

  Future<void> _handlePaywallClosedEvent(
    PurchasePaywallClosedEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    Apphud.paywallClosed(event.paywall).then(
      (value) => printAsJson(
        'paywallClosed(${event.paywall.identifier})',
        'success',
      ),
      onError: (e) => printError(
        'paywallClosed(${event.paywall.identifier})',
        e,
      ),
    );
  }

  Future<void> _handlePaywallShownEvent(
    PurchasePaywallShownEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    Apphud.paywallShown(event.paywall).then(
      (value) => printAsJson(
        'paywallShown(${event.paywall.identifier})',
        'success',
      ),
      onError: (e) => printError(
        'paywallShown(${event.paywall.identifier})',
        e,
      ),
    );
  }

  Future<void> _handlePurchaseProductEvent(
    PurchasePurchaseProductEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    await state.mapOrNull(success: (s) async {
      emit(s.copyWith(inProgress: true));
      final subscriptionOfferDetails =
          event.product.productDetails?.subscriptionOfferDetails ?? [];
      final offerIdToken = subscriptionOfferDetails.isEmpty
          ? null
          : subscriptionOfferDetails.first.offerToken;
      final result = await Apphud.purchase(
        //productId: event.product.productId,
        // or we can use
        product: event.product,
        offerIdToken: offerIdToken,
      );
      printAsJson('purchaseProduct(${event.product.productId})', result);
      if (result.error == null) {
        emit(s.copyWith(userMessage: PurchaseUserMessage.purchaseSuccess()));
        emit(s.copyWith(userMessage: PurchaseUserMessage.none()));
      } else {
        emit(s.copyWith(
          userMessage: PurchaseUserMessage.purchaseFailure(result.error!),
        ));
        emit(s.copyWith(userMessage: PurchaseUserMessage.none()));
      }
    });
  }

  Future<void> _handleRestorePurchasesEvent(
    PurchaseRestorePurchasesEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    await state.mapOrNull(
      success: (s) async {
        emit(s.copyWith(inProgress: true));
        printAsJson('try to restore purchases', '');
        final result = await Apphud.restorePurchases();
        printAsJson('restorePurchases()', result);
        if (result.error == null) {
          emit(s.copyWith(
              userMessage: PurchaseUserMessage.restorePurchasesSuccess()));
          emit(s.copyWith(userMessage: PurchaseUserMessage.none()));
        } else {
          emit(s.copyWith(
            userMessage:
                PurchaseUserMessage.restorePurchasesFailure(result.error!),
          ));
          emit(s.copyWith(userMessage: PurchaseUserMessage.none()));
        }
      },
    );
  }

  Future<void> _handleSyncPurchaseEvent(
    PurchaseSyncPurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    Apphud.syncPurchasesInObserverMode().then(
      (value) => printAsJson('syncPurchases()', 'success'),
      onError: (e) => printError('syncPurchases()', e),
    );
  }

  Future<void> _handleCallAllEvent(
    PurchaseCallAllEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    // Apphud.hasActiveSubscription().then(
    //   (value) => printAsJson('hasActiveSubscription()', value),
    //   onError: (e) => printError('hasActiveSubscription()', e),
    // );
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
    //   provider: _attributionProvider,
    // ).then(
    //       (value) =>
    //       printAsJson(
    //         'Parameters and the result of addAttribution()',
    //         <String, dynamic>{
    //           'parameters': <String, dynamic>{
    //             'data': _attributionData,
    //             'provider': _attributionProvider.convertToString,
    //           },
    //           'result': value,
    //         },
    //         printOnlyMethodName: true,
    //       ),
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
    // Apphud.paywallsDidLoadCallback().then(
    //   (value) => printAsJson(
    //     'paywallsDidLoadCallback',
    //     value,
    //   ),
    //   onError: (e) => printError('paywallsDidLoadCallback', e),
    // );

    //   final placements = await Apphud.placements();
    //   printAsJson('placements', placements);
    //
    //   if (placements.isNotEmpty) {
    //      final placement = await Apphud.placement(placements.first.identifier);
    //      printAsJson('placement', placement);
    //   }
    //
    // Apphud.fetchPlacements().then(
    //   (value) => printAsJson(
    //     'fetchPlacements',
    //     value,
    //   ),
    //   onError: (e) => printError('fetchPlacements', e),
    // );
    //
    //   Apphud.rawPlacements().then(
    //     (value) => printAsJson(
    //       'rawPlacements',
    //       value,
    //     ),
    //     onError: (e) => printError('rawPlacements', e),
    //   );
    //
    //   Apphud.rawPaywalls().then(
    //     (value) => printAsJson(
    //       'rawPaywalls',
    //       value,
    //     ),
    //     onError: (e) => printError('rawPaywalls', e),
    //   );
    // Apphud.paywallsDidLoadCallback().then(
    //   (value) => printAsJson(
    //     'paywallsDidLoadCallback',
    //     value,
    //   ),
    //   onError: (e) => printError('paywallsDidLoadCallback', e),
    // );
    // Apphud.refreshUserData().then(
    //   (value) => printAsJson(
    //     'refreshUserData',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('refreshUserData', e),
    // );
    // Apphud.permissionGroups().then(
    //     (value) => printAsJson('permissionGroups', value)
    // );

    Apphud.loadFallbackPaywalls().then(
      (value) => printAsJson('loadFallbackPaywalls', value),
      onError: (e) => printError('loadFallbackPaywalls', e),
    );
  }
}
