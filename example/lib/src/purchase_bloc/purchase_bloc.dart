import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/android/android_purchase_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_data.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:apphud/models/apphud_models/apphud_debug_level.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:apphud_example/src/common/app_navigator.dart';
import 'package:apphud_example/src/common/app_secrets_base.dart';
import 'package:apphud_example/src/common/debug_print_mixin.dart';
import 'package:apphud_example/src/common/env_config.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_user_message.dart';
import 'package:apphud_example/src/view/widgets/pretty_json_dialog.dart';
import 'package:bloc/bloc.dart';

import 'purchase_event.dart';
export 'purchase_event.dart';

import 'purchase_state.dart';
export 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState>
    with DebugPrintMixin
    implements ApphudListener {
  /// Survives widget-tree recreation within the same Dart isolate so we do not
  /// call [Apphud.start] twice. Across Flutter engine recreate, the native
  /// plugin returns the existing user instead of aborting.
  static bool _sdkStarted = false;

  final AppSecretsBase _appSecrets;
  ApphudUser? _apphudUser;

  ApphudUser? get currentUser => _apphudUser;

  PurchaseBloc({
    required AppSecretsBase appSecrets,
  })  : _appSecrets = appSecrets,
        super(PurchaseState.initialization()) {
    on<PurchaseEvent>(_handlePurchaseEvent);
    Apphud.setListener(listener: this);
    Apphud.setDeeplinkHandler(_onDeeplinkAttribution);
  }

  void _onDeeplinkAttribution(ApphudDeeplinkAttribution attribution) {
    final payload = {
      'kind': attribution.kind.name,
      'url': attribution.url,
      'attribution': attribution.attribution,
    };
    printAsJson('Apphud.deeplinkHandler', payload);

    // Only surface a successful match (skip match_type null / "none").
    final matchType = _deeplinkMatchType(attribution.attribution);
    if (matchType != 'deterministic' && matchType != 'probabilistic') {
      return;
    }

    final context = appNavigatorKey.currentContext;
    if (context != null) {
      showPrettyJsonDialog(context, 'Non-organic deeplink match', payload);
    }
  }

  /// Reads `data.results.raw.match_type` from the API envelope, with fallbacks
  /// if the native layer already unwrapped part of the payload.
  String? _deeplinkMatchType(Map<String, dynamic> attribution) {
    dynamic raw = attribution['raw'];
    final data = attribution['data'];
    if (data is Map) {
      final results = data['results'];
      if (results is Map) {
        raw = results['raw'];
      }
    } else {
      final results = attribution['results'];
      if (results is Map) {
        raw = results['raw'];
      }
    }
    if (raw is Map) {
      return raw['match_type']?.toString();
    }
    return attribution['match_type']?.toString();
  }

  Future<void> _handlePurchaseEvent(
    PurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    await event.map(
      started: (e) => _handleStartedEvent(e, emit),
      placementsFetched: (e) => _handlePlacementsFetchedEventt(e, emit),
      callAll: (e) => _handleCallAllEvent(e, emit),
      grantPromotional: (e) => _handleGrantPromotionalEvent(e, emit),
      paywallShown: (e) => _handlePaywallShownEvent(e, emit),
      purchaseProduct: (e) => _handlePurchaseProductEvent(e, emit),
      purchasePromo: (e) => _handlePurchasePromoEvent(e, emit),
      restorePurchases: (e) => _handleRestorePurchasesEvent(e, emit),
      syncPurchase: (e) => _handleSyncPurchaseEvent(e, emit),
      trackPurchase: (e) => _handleTrackPurchaseEvent(e, emit),
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
    printAsJson('ApphudListener.apphudDidFetchProducts', 'success');
  }

  @override
  Future<void> apphudNonRenewingPurchasesUpdated(
    List<ApphudNonRenewingPurchase> purchases,
  ) async {
    printAsJson('ApphudListener.apphudNonRenewingPurchasesUpdated', 'success');
  }

  @override
  Future<void> apphudSubscriptionsUpdated(
    List<ApphudSubscriptionWrapper> subscriptions,
  ) async {
    printAsJson('ApphudListener.apphudSubscriptionsUpdated', 'success');
  }

  @override
  Future<void> placementsDidFullyLoad(List<ApphudPlacement> placements) async {
    printAsJson('ApphudListener.placementsDidFullyLoad', 'success');
    add(PurchaseEvent.placementsFetched(placements));
  }

  @override
  Future<void> userDidLoad(ApphudUser user) async {
    printAsJson('ApphudListener.userDidLoad', 'success');
    _apphudUser = user;
    state.mapOrNull(
      success: (s) => emit(s.copyWith(user: user)),
    );
  }

  @override
  Future<void> apphudDidReceivePurchase(AndroidPurchaseWrapper purchase) async {
    printAsJson('ApphudListener.apphudDidReceivePurchase', 'success');
  }

  Future<void> _handleStartedEvent(
    PurchaseStartedEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      if (_sdkStarted) {
        printAsJson('Apphud.start', 'skipped (already started)');
        emit(PurchaseState.initialization(isStartSuccess: true));
        final placements = await Apphud.placements();
        add(PurchaseEvent.placementsFetched(placements));
        return;
      }

      await Apphud.enableDebugLogs(level: ApphudDebugLevel.high);

      final apphudHost = EnvConfig.apphudHost;
      if (apphudHost != null) {
        await Apphud.setHost(apphudHost);
      }
      _apphudUser = await Apphud.start(
        apiKey: _appSecrets.apiKey,
        userID: _appSecrets.userID,
        observerMode: _appSecrets.observeMode,
        baseUrl: apphudHost,
      );
      _sdkStarted = true;
      emit(PurchaseState.initialization(isStartSuccess: true));
      printAsJson('user registered', 'success');

      // Request deferred deep link attribution after the SDK has started.
      // The result is delivered via the handler registered with
      // Apphud.setDeeplinkHandler in this bloc's constructor.
      try {
        await Apphud.requestDeferredDeeplinkAttribution();
      } catch (error) {
        printAsJson('Apphud.requestDeferredDeeplinkAttribution', {
          'error': error.toString(),
        });
      }

      final placements = await Apphud.placements();
      add(PurchaseEvent.placementsFetched(placements));
    } catch (error) {
      emit(PurchaseState.startFailed(error.toString()));
    }
  }

  Future<void> _handlePlacementsFetchedEventt(
    PurchasePlacementsFetchedEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    state.mapOrNull(
      initialization: (s) {
        if (s.isStartSuccess) {
          emit(PurchaseState.success(
            placements: event.placements,
            paywalls: _paywallsFromPlacements(event.placements),
            user: _apphudUser,
          ));
        } else {
          emit(s.copyWith(
            isPlacementsFetched: true,
            placements: event.placements,
          ));
        }
      },
      success: (s) => emit(s.copyWith(
        placements: event.placements,
        paywalls: _paywallsFromPlacements(event.placements),
        user: _apphudUser,
      )),
    );
  }

  ApphudPaywalls _paywallsFromPlacements(List<ApphudPlacement> placements) {
    return ApphudPaywalls(
      paywalls: placements
          .map((placement) => placement.paywall)
          .whereType<ApphudPaywall>()
          .toList(),
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
      final offerIdToken =
          subscriptionOfferDetails.map((o) => o.offerToken).firstWhere(
                (token) => token != null && token.isNotEmpty,
                orElse: () => null,
              );
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

  Future<void> _handlePurchasePromoEvent(
    PurchasePurchasePromoEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    await state.mapOrNull(success: (s) async {
      emit(s.copyWith(inProgress: true));
      try {
        final result = await Apphud.purchasePromo(
          productId: event.product.productId,
          discountID: event.discountID,
        );
        printAsJson(
          'purchasePromo(${event.product.productId}, ${event.discountID})',
          result,
        );
        if (result.error == null) {
          emit(s.copyWith(userMessage: PurchaseUserMessage.purchaseSuccess()));
          emit(s.copyWith(userMessage: PurchaseUserMessage.none()));
        } else {
          emit(s.copyWith(
            userMessage: PurchaseUserMessage.purchaseFailure(result.error!),
          ));
          emit(s.copyWith(userMessage: PurchaseUserMessage.none()));
        }
      } catch (e) {
        printError('purchasePromo(${event.product.productId})', e);
        emit(s.copyWith(inProgress: false));
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

  Future<void> _handleTrackPurchaseEvent(
    PurchaseTrackPurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    Apphud.trackPurchase(productId: event.product.productId).then(
      (value) => printAsJson('trackPurchase()', 'success'),
      onError: (e) => printError('trackPurchase()', e),
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
    Apphud.subscriptions().then(
      (value) => printAsJson('subscriptions()', value),
      onError: (e) => printError('subscriptions()', e),
    );

    Apphud.nonRenewingPurchases().then(
      (value) => printAsJson('nonRenewingPurchases()', value),
      onError: (e) => printError('nonRenewingPurchases()', e),
    );

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
    final data = ApphudAttributionData(rawData: {});
    final provider = ApphudAttributionProvider.custom;
    Apphud.setAttribution(provider: provider, data: data).then(
      (value) => printAsJson(
        'Parameters and the result of setAttribution()',
        <String, dynamic>{
          'parameters': <String, dynamic>{
            'data': data.toJson(),
            'provider': provider,
          },
          'result': value,
        },
        printOnlyMethodName: true,
      ),
      onError: (e) => printError('_setAttribution()', e),
    );
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
    // Apphud.loadFallbackPaywalls().then(
    //   (value) => printAsJson('loadFallbackPaywalls', value),
    //   onError: (e) => printError('loadFallbackPaywalls', e),
    // );

    // await Apphud.refreshUserData().then(
    //   (value) => printAsJson(
    //     'refreshUserData',
    //     value,
    //   ),
    //   onError: (e) => printError('refreshUserData', e),
    // );

    // await Apphud.setUserProperty(
    //   key: ApphudUserPropertyKey.customProperty('some_key'),
    //   value: 'some_value',
    // ).then(
    //   (value) => printAsJson(
    //     'setUserProperty',
    //     'Ok',
    //   ),
    //   onError: (e) => printError('setUserProperty', e),
    // );
    // await Apphud.forceFlushUserProperties().then(
    //   (value) => printAsJson(
    //     'forceFlushUserProperties',
    //     value,
    //   ),
    //   onError: (e) => printError('forceFlushUserProperties', e),
    // );
    // await Apphud.fetchPlacements().then(
    //   (value) => printAsJson(
    //     'fetchPlacements',
    //     value,
    //   ),
    //   onError: (e) => printError('fetchPlacements', e),
    // );
    // await Apphud.permissionGroups().then(
    //   (value) => printAsJson(
    //     'permissionGroups',
    //     value,
    //   ),
    //   onError: (e) => printError('permissionGroups', e),
    // );
    await Apphud.attributeFromWeb({
      'apphud_user_id': _apphudUser?.userId,
    }).then(
      (value) {
        printAsJson('attributeFromWeb isSuccessful', value.$1);
        printAsJson('attributeFromWeb user', value.$2);
      },
      onError: (e) => printError('attributeFromWeb', e),
    );
    await Apphud.permissionGroups().then(
      (value) => printAsJson(
        'permissionGroups',
        value,
      ),
      onError: (e) => printError('permissionGroups', e),
    );
  }
}
