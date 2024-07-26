import 'dart:async';

import 'package:apphud/listener/apphud_listener.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_debug_level.dart';
import 'package:apphud/models/apphud_models/apphud_group.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_placements.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:flutter/services.dart';

import 'listener/apphud_listener_handler.dart';
import 'models/apphud_models/apphud_attribution_provider.dart';
import 'models/apphud_models/apphud_error.dart';
import 'models/apphud_models/composite/apphud_product_composite.dart';
import 'models/apphud_models/composite/apphud_purchase_result.dart';
import 'models/extensions.dart';
export 'listener/apphud_listener.dart';

class Apphud {
  static const MethodChannel _channel = MethodChannel('apphud');
  static const MethodChannel _listenerChannel =
      MethodChannel('apphud/listener');
  static ApphudListenerHandler? _apphudListenerHandler;

  // Initialization

  /// Initializes Apphud SDK. You should call it during app launch.
  ///
  /// - parameter [apiKey] is required. Your api key.
  /// - parameter [userID] is optional. You can provide your own unique user identifier. If null passed then UUID will be generated instead.
  /// - parameter [observerMode] is optional, iOS only. Sets SDK to Observer (i.e. Analytics) mode. If you purchase products by other code, then pass `true`.
  /// If you purchase products using `Apphud.purchase(..)` method, then pass `false`. Default value is `false`.
  ///
  /// - Returns `ApphudUser` object after the SDK initialization is complete.
  /// __Note__: Do not store `ApphudUser` instance in your own code, since it may change at runtime.
  static Future<ApphudUser> start({
    required String apiKey,
    String? userID,
    bool? observerMode,
  }) async {
    final json = await _channel.invokeMethod('start', {
      'apiKey': apiKey,
      'userID': userID,
      'observerMode': observerMode ?? false,
    });
    return ApphudUser.fromJson(json);
  }

  /// Initializes Apphud SDK with User ID & Device ID pair. Not recommended for use unless you know what you are doing.
  ///
  /// - parameter [apiKey] is required. Your api key.
  /// - parameter [userID] is optional. You can provide your own unique user identifier. If null passed then UUID will be generated instead.
  /// - parameter [deviceID] is optional. You can provide your own unique device identifier. If null passed then UUID will be generated instead.
  /// - parameter [observerMode] is optional, iOS only. Sets SDK to Observer (Analytics) mode. If you purchase products by your own code, then pass `true`.
  /// If you purchase products using `Apphud.purchase(product)` method, then pass `false`. Default value is `false`.
  ///
  /// - Returns `ApphudUser` object after the SDK initialization is complete.
  /// __Note__: Do not store `ApphudUser` instance in your own code, since it may change at runtime.
  static Future<ApphudUser> startManually({
    required String apiKey,
    String? userID,
    String? deviceID,
    bool? observerMode,
  }) async {
    final json = await _channel.invokeMethod('startManually', {
      'apiKey': apiKey,
      'deviceID': deviceID,
      'userID': userID,
      'observerMode': observerMode ?? false,
    });
    return ApphudUser.fromJson(json);
  }

  /// Updates user ID value.
  ///
  /// Updates the user ID. This method should only be called after the user is registered.
  ///
  /// - parameter [userID] is required. New user ID value.
  static Future<void> updateUserID(String userID) =>
      _channel.invokeMethod('updateUserID', {'userID': userID});

  /// Returns current user ID.
  ///
  /// This value may change in runtime.
  static Future<String> userID() async {
    return (await _channel.invokeMethod<String>('userID'))!;
  }

  /// Returns current device ID.
  ///
  /// You should use it only if you want to implement custom logout/login flow by saving User ID & Device ID pair for each app user.
  static Future<String> deviceID() async {
    return (await _channel.invokeMethod('deviceID'))!;
  }

  /// Logs out current user, clears all saved data and resets SDK to uninitialized state.
  ///
  /// You will need to call `Apphud.start()` or `Apphud.startManually()` again to initialize SDK with a new user.
  /// This might be useful if you have your custom logout/login flow and
  /// you want to take control of each logged-in user's subscription status.
  /// If previous user had active subscription, the new logged-in user
  /// can still restore purchases on this device and both users will be merged
  /// under the previous paid one, because Apple ID is tied to a device.
  static Future<void> logout() => _channel.invokeMethod('logout');

  /// Set listener
  ///
  /// - parameter [listener] is optional. When the parameter is null or omitted,
  // the previous set listener will be removed. The only one listener
  // may be used at the same time, so the new listener replaces the previous.
  static Future<void> setListener({ApphudListener? listener}) async {
    _apphudListenerHandler?.dispose();
    _apphudListenerHandler = null;
    if (listener != null) {
      _apphudListenerHandler = ApphudListenerHandler(
        channel: _listenerChannel,
        listener: listener,
      );
    }
  }

  // === Placements, Paywalls and Products ===

  /// Asynchronously retrieves the paywall placements configured in Product Hub > Placements,
  /// potentially altered based on the user's involvement in A/B testing, if any.
  /// Awaits until the inner Stores products are loaded from the App Store or Google Play.
  ///
  /// A placement is a specific location within a user's journey (such as onboarding, settings, etc.)
  /// where its internal paywall is intended to be displayed.
  /// See documentation for details: https://docs.apphud.com/docs/placements
  /// For immediate access without awaiting Stores products, use `rawPlacements()` method.
  ///
  /// Returns: An array of [ApphudPlacement] objects, representing the configured placements.
  static Future<List<ApphudPlacement>> placements() async {
    final List<Map<dynamic, dynamic>>? placements =
        (await _channel.invokeMethod<List<dynamic>>('placements'))?.toMapList;

    if (placements != null) {
      return placements.map((json) => ApphudPlacement.fromJson(json)).toList();
    }
    return const [];
  }

  /// Asynchronously retrieves a specific paywall placement by its identifier
  /// configured in Product Hub > Placements, potentially altered based on the user's involvement in A/B testing, if any.
  /// Awaits until the inner Stores products are loaded from the App Store or Google Play.
  ///
  /// A placement is a specific location within a user's journey (such as onboarding, settings, etc.)
  /// where its internal paywall is intended to be displayed.
  /// See documentation for details: https://docs.apphud.com/docs/placements
  /// For immediate access without awaiting Stores products, use `rawPlacements()` method.
  ///
  /// Returns: An  [ApphudPlacement] object if found, or `null` if no matching placement is found.
  static Future<ApphudPlacement?> placement(String identifier) async {
    final Map<dynamic, dynamic>? json = await _channel.invokeMethod(
      'placement',
      {
        'identifier': identifier,
      },
    );
    return json == null ? null : ApphudPlacement.fromJson(json);
  }

  /// Returns the placements from Product Hub > Placements, potentially altered
  /// based on the user's involvement in A/B testing, if any.
  ///
  /// A placement is a specific location within a user's journey
  /// (such as onboarding, settings, etc.) where its internal paywall is intended to be displayed.
  ///
  /// See documentation for details: https://docs.apphud.com/docs/placements
  /// For immediate access without awaiting `SKProduct`s or `ProductDetails`, use `rawPlacements()` method.
  static Future<ApphudPlacements> fetchPlacements() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('fetchPlacements');
    if (json == null) {
      return ApphudPlacements(
        placements: const [],
        error: ApphudError(message: 'fetchPlacements error'),
      );
    }
    return ApphudPlacements.fromJson(json);
  }

  /// A list of paywall placements, potentially altered based on the user's involvement in A/B testing, if any.
  /// A placement is a specific location within a user's journey (such as onboarding, settings, etc.)
  /// where its internal paywall is intended to be displayed.
  ///
  /// Important: This function doesn't await until inner Stores products are loaded.
  /// That means paywalls may or may not have inner `SKProduct` / `ProductDetails` at the time you call this function.
  ///
  /// Important: This function will return empty array if user is not yet loaded, or placements are not set up in the Product Hub.
  ///
  /// To get placements with awaiting for native Stores products,
  /// use await Apphud.placements() or Apphud.placementsDidLoadCallback(...) functions.
  ///
  /// Returns: An array of `ApphudPlacement` objects, representing the configured placements.
  static Future<List<ApphudPlacement>> rawPlacements() async {
    final List<Map<dynamic, dynamic>>? placements =
        (await _channel.invokeMethod<List<dynamic>>('rawPlacements'))
            ?.toMapList;

    if (placements != null) {
      return placements.map((json) => ApphudPlacement.fromJson(json)).toList();
    }
    return const [];
  }

  /// Asynchronously retrieves paywalls from Product Hub > Paywalls,
  /// potentially altered based on the user's involvement in A/B testing, if any.
  /// Each paywall contains an array of `ApphudProduct` objects that
  /// can be used for purchases.
  /// `ApphudProduct` is Apphud's wrapper around native Stores products.
  ///
  /// Awaits until the inner Stores products are loaded from the App Store or Google Play.
  /// If you want to obtain paywalls without awaiting for native products,
  /// you can use `rawPaywalls()` method.
  static Future<ApphudPaywalls?> paywalls() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('paywalls');
    return json != null ? ApphudPaywalls.fromJson(json) : null;
  }

  /// A list of paywalls, potentially altered based on the user's involvement in A/B testing, if any.
  ///
  /// Important: This function doesn't await until inner native products are loaded from the stores.
  /// That means paywalls may or may not have inner `SKProduct` / `ProductDetails` at the time you call this function.
  ///
  /// Important: This function will return empty array if user is not yet loaded, or paywalls are not set up in the Product Hub.
  ///
  /// To get paywalls with awaiting for native products, use await Apphud.paywalls() or Apphud.paywallsDidLoadCallback(...) functions.
  static Future<ApphudPaywalls?> rawPaywalls() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('rawPaywalls');
    return json != null ? ApphudPaywalls.fromJson(json) : null;
  }

  /// Retrieves the paywalls configured in Product Hub > Paywalls,
  /// potentially altered based on the user's involvement in A/B testing, if any.
  /// Awaits until the inner Stores products are loaded from the App Store or Google Play.
  ///
  /// For immediate access without awaiting `SKProduct`s or `ProductDetails`, use `rawPaywalls()` method.
  static Future<ApphudPaywalls> paywallsDidLoadCallback() async {
    final Map<dynamic, dynamic>? json = await _channel
        .invokeMethod<Map<dynamic, dynamic>>('paywallsDidLoadCallback');
    if (json == null) {
      return ApphudPaywalls(
        error: ApphudError(message: 'paywallsDidLoadCallback error'),
      );
    }
    return ApphudPaywalls.fromJson(json);
  }

  /// Call this method when your paywall screen is displayed to the user.
  /// This is required for A/B testing analysis.
  static Future<void> paywallShown(ApphudPaywall paywall) =>
      _channel.invokeMethod(
        'paywallShown',
        {
          'identifier': paywall.identifier,
          'placementIdentifier': paywall.placementIdentifier,
        },
      );

  /// Call this method when your paywall screen is dismissed without a purchase.
  /// This is required for A/B testing analysis.
  static Future<void> paywallClosed(ApphudPaywall paywall) =>
      _channel.invokeMethod(
        'paywallClosed',
        {
          'identifier': paywall.identifier,
          'placementIdentifier': paywall.placementIdentifier,
        },
      );

  /// Android only. Explicitly loads fallback paywalls from the json file, if it was added to the project assets.
  ///
  /// By default, SDK automatically tries to load paywalls from the JSON file, if possible.
  /// However, developer can also call this method directly for more control.
  /// For more details, visit https://docs.apphud.com/docs/paywalls#set-up-fallback-mode
  static Future<ApphudPaywalls?> loadFallbackPaywalls() async {
    final Map<dynamic, dynamic>? json = await _channel
        .invokeMethod<Map<dynamic, dynamic>>('loadFallbackPaywalls');
    return json != null ? ApphudPaywalls.fromJson(json) : null;
  }

  // Make Purchase

  ///  Purchase product and automatically submits App Store Receipt (iOS) or Google Play purchase token (Android) to Apphud.
  ///
  /// - parameter [productId] - Not recommended for use. Pass either `productId` or `product` object. Is an identifier of the native product that user wants to purchase. A/B analytics and other features may not work if purchasing via productId.
  /// - parameter [product] - Recommended for use. Is an `ApphudProduct` object from your `ApphudPaywall`. You must first configure paywalls [and optionally placements] in Apphud > Product Hub.
  /// - parameter [offerIdToken] - Android only. Required for Subscriptions. The identifier of the offer for initiating the purchase. Developer should retrieve it manually from `SubscriptionOfferDetails` object.
  /// - parameter [oldToken] - Android only. Optional. Specifies the Google Play Billing purchase token that the user is upgrading or downgrading from.
  /// - parameter [replacementMode] - Android only. Optional. Replacement mode (https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.SubscriptionUpdateParams.ReplacementMode?hl=en)
  ///
  /// Returns [ApphudPurchaseResult] object
  static Future<ApphudPurchaseResult> purchase({
    String? productId,
    ApphudProduct? product,
    String? offerIdToken,
    String? oldToken,
    int? replacementMode,
  }) async {
    try {
      assert(
        !(productId == null && product == null),
        'Both productId and product can not be null at the same time',
      );
      assert(
        !(productId != null && product != null),
        'Both productId and product can not be non null at the same time',
      );
      dynamic json;
      if (productId != null) {
        json = await _channel.invokeMethod(
          'purchase',
          {
            'productId': productId,
            'offerIdToken': offerIdToken,
            'oldToken': oldToken,
            'replacementMode': replacementMode,
          },
        );
      } else if (product != null) {
        json = await _channel.invokeMethod(
          'purchaseProduct',
          product.toJson()
            ..remove('productDetails')
            ..remove('skProduct')
            ..addAll({
              'offerIdToken': offerIdToken,
              'oldToken': oldToken,
              'replacementMode': replacementMode,
            }),
        );
      }
      return ApphudPurchaseResult.fromJson(json);
    } catch (e) {
      return ApphudPurchaseResult(error: ApphudError(message: e.toString()));
    }
  }

  /// Android only. Tracks a purchase made through Google Play. This method should be used only in Observer Mode,
  /// specifically when utilizing Apphud Paywalls and Placements, and when you need to associate the
  /// purchase with specific paywall and placement identifiers.
  ///
  /// In all other cases, purchases will be automatically intercepted and sent to Apphud.
  ///
  /// Note: The `offerIdToken` is mandatory for subscriptions. The `paywallIdentifier` and `placementIdentifier`
  /// are optional but recommended for A/B test analysis in Observer Mode.
  ///
  /// - parameter [productId] The Google Play product ID of the item to purchase.
  /// - parameter [offerIdToken] The identifier of the subscription's offer token. This parameter is required for subscriptions.
  /// - parameter [paywallIdentifier] (Optional) The identifier of the paywall.
  /// - parameter [placementIdentifier] (Optional) The identifier of the placement.
  static Future<void> trackPurchase({
    required String productId,
    String? offerIdToken,
    String? paywallIdentifier,
    String? placementIdentifier,
  }) async {
    return _channel.invokeMethod(
      'trackPurchase',
      {
        'productId': productId,
        'offerIdToken': offerIdToken,
        'paywallIdentifier': paywallIdentifier,
        'placementIdentifier': placementIdentifier,
      },
    );
  }

  /// This method automatically sends in-app purchase receipt to Apphud, so you don't need to call `submitReceipt` method.
  /// - parameter [productId] is required. This is an [productId] that user wants to purchase.
  /// - parameter [discountID] is required. This is a Identifier String object that you would like to apply.
  /// Returns [ApphudPurchaseResult] object.
  static Future<ApphudPurchaseResult> purchasePromo({
    required String productId,
    required String discountID,
  }) async {
    final dynamic json = await _channel.invokeMethod(
      'purchasePromo',
      {
        'productId': productId,
        'discountID': discountID,
      },
    );
    return ApphudPurchaseResult.fromJson(json!);
  }

  ///  Displays an offer code redemption sheet.
  static Future<void> presentOfferCodeRedemptionSheet() async {
    await _channel.invokeMethod('presentOfferCodeRedemptionSheet');
  }

  /// Returns [ApphudProductComposite] object by [productIdentifier].
  ///
  /// Note that you have to add this product identifier in Apphud Dashboard > Product Hub > Products.
  /// Will return `null` if product is not yet fetched from the App Store.
  /// Best practise is not to use this method, but implement paywalls logic by adding your
  /// paywall configuration in Apphud Dashboard > Product Hub > Paywalls.
  static Future<ApphudProductComposite?> product(
      String productIdentifier) async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'product',
      {'productIdentifier': productIdentifier},
    );

    return json != null ? ApphudProductComposite.fromJson(json) : null;
  }

  /// Returns array of [ApphudProductComposite] objects that you added in Apphud > Product Hub > Products.
  static Future<List<ApphudProductComposite>> products() async {
    List<Map<dynamic, dynamic>>? products =
        (await _channel.invokeMethod<List<dynamic>>('products'))?.toMapList;
    if (products == null) return const [];
    return products.map(ApphudProductComposite.fromJson).toList();
  }

  /// Android only. Refreshes current user data, which includes:
  ///
  /// paywalls, placements, subscriptions, non-renewing purchases, or promotionals.
  /// To be notified about updates, listen for `ApphudListener`'s `apphudSubscriptionsUpdated` and
  /// `apphudNonRenewingPurchasesUpdated` methods.
  /// Do not call this method on app launch, as Apphud SDK does it automatically.
  /// You can call this method, when the app reactivates from the background, if needed.
  static Future<void> refreshUserData() =>
      _channel.invokeMethod('refreshUserData');

// Handle Purchases

  /// Returns permission groups configured in Apphud dashboard > Product Hub > Products. Groups are cached on device.
  ///
  /// Note that this method returns empty array if `ProductDetails` or 'SkProduct' are not yet fetched from Google Play / App Store.
  /// To get notified when `permissionGroups` are ready to use, use ApphudListener's `paywallsDidFullyLoad` method
  /// Best practice is not to use this method at all, but use `paywalls()` instead.
  static Future<List<ApphudGroup>> permissionGroups() async {
    List<Map<dynamic, dynamic>> groups =
        (await _channel.invokeMethod<List<dynamic>>('permissionGroups'))!
            .toMapList;
    return groups.map((json) => ApphudGroup.fromJson(json)).toList();
  }

  /// Returns `true` if user has active subscription or non renewing purchase (lifetime).
  ///
  /// Determines if the user has active premium access, which includes any active subscription
  /// or non-renewing purchase (lifetime).
  ///
  /// Note: This method is not suitable for consumable in-app purchases, like coin packs.
  /// Use this method to check if the user has active premium access.
  /// If you have consumable purchases, consider using alternative methods, as this won't distinguish consumables from non-consumables.
  static Future<bool> hasPremiumAccess() async {
    return (await _channel.invokeMethod('hasPremiumAccess')) ?? false;
  }

  /// Returns `true` if user has active subscription. Value is cached on device.
  ///
  /// Checks if the user has an active subscription. The information is cached on the device.
  /// Use this method to determine whether the user has an active premium subscription.
  ///
  /// Note: If you offer lifetime purchases, you must use `hasPremiumAccess` or `isNonRenewingPurchaseActive` method.
  static Future<bool> hasActiveSubscription() async {
    return (await _channel.invokeMethod('hasActiveSubscription')) ?? false;
  }

  ///  Returns [ApphudSubscriptionWrapper] subscription object that current user has ever purchased. Subscriptions are cached on device.
  ///
  ///  If returned object is not null, it doesn't mean that subscription is active.
  ///  You should check `Apphud.hasActiveSubscription()` method or `subscription.isActive()` value to determine whether or not to unlock premium functionality to the user.
  ///  If you have more than one subscription group in your app, use `subscriptions()` method and get `isActive` value for your desired subscription.
  static Future<ApphudSubscriptionWrapper?> subscription() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('subscription');
    return json != null ? ApphudSubscriptionWrapper.fromJson(json) : null;
  }

  /// Returns an array of all subscriptions that this user has ever purchased. Subscriptions are cached on device.
  ///
  /// Use this method if you have more than one subscription group in your app.
  static Future<List<ApphudSubscriptionWrapper>> subscriptions() async {
    final List<Map<dynamic, dynamic>>? subscriptions =
        (await _channel.invokeMethod<List<dynamic>>('subscriptions'))
            ?.toMapList;
    if (subscriptions != null) {
      return subscriptions
          .map((json) => ApphudSubscriptionWrapper.fromJson(json))
          .toList();
    }
    return List<ApphudSubscriptionWrapper>.of([]);
  }

  ///  Returns an array of all standard in-app purchases (consumables, non-consumables or non-renewing subscriptions) that this user has ever purchased.
  ///
  ///  Purchases are cached on device. This array is sorted by purchase date. Apphud only tracks consumables if they were purchased after integrating Apphud SDK.
  static Future<List<ApphudNonRenewingPurchase>> nonRenewingPurchases() async {
    final List<Map<dynamic, dynamic>>? purchases =
        (await _channel.invokeMethod<List<dynamic>>('nonRenewingPurchases'))
            ?.toMapList;

    if (purchases != null) {
      return purchases
          .map((json) => ApphudNonRenewingPurchase.fromJson(json))
          .toList();
    }
    return List<ApphudNonRenewingPurchase>.of([]);
  }

  /// Returns `true` if current user has purchased standard in-app purchase with given [productIdentifier].
  ///
  /// Returns `false` if this product is refunded or never purchased. Includes consumables, non-consumables or non-renewing subscriptions. Apphud only tracks consumables if they were purchased after integrating Apphud SDK.
  /// Purchases are sorted by purchase date, so it returns Bool value for the most recent purchase by given product identifier.
  static Future<bool> isNonRenewingPurchaseActive(
    String productIdentifier,
  ) async {
    return (await _channel.invokeMethod<bool>(
          'isNonRenewingPurchaseActive',
          {'productIdentifier': productIdentifier},
        )) ??
        false;
  }

  /// Implements `Restore Purchases` mechanism. Basically it just sends current
  /// App Store Receipt (iOS) or Google Play Purchase Tokens (Android) to Apphud and returns subscriptions info.
  ///
  /// Even if callback returns some data, it doesn't mean that user is premium.
  /// You should call `subscription.isActive()` value or `Apphud.hasPremiumAccess`.
  ///
  /// Returns [ApphudComposite] contain array of subscription (or subscriptions in case you have more than one subscription group) and array of standard in-app purchases.
  static Future<ApphudComposite> restorePurchases() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('restorePurchases'))!;

    return ApphudComposite.fromJson(json);
  }

  /// Android only. This method will send purchases to the Apphud server.
  ///
  /// If you use your own purchase logic, you must call this method after every successful purchase or restore.
  static Future<void> syncPurchasesInObserverMode() async {
    await _channel.invokeMethod('syncPurchasesInObserverMode');
  }

// User Properties

  /// Set custom user property. Value must be one of: `int`, `float`, `bool`, `String`, `null`.

  /// Example:
  /// ```dart
  /// // use built-in property key
  /// Apphud.setUserProperty(key: ApphudUserPropertyKey.email, value: 'user4@example.com', setOnce: true)
  /// // use custom property key
  /// Apphud.setUserProperty(key: ApphudUserPropertyKey.customProperty('custom_test_property_1'), value: 0.5)
  /// ```
  ///
  /// You can use several built-in keys with their value types:
  /// `ApphudUserPropertyKey.email`: User email. Value must be String.
  /// `ApphudUserPropertyKey.name`: User name. Value must be String.
  /// `ApphudUserPropertyKey.phone`: User phone number. Value must be String.
  /// `ApphudUserPropertyKey.age`: User age. Value must be Int.
  /// `ApphudUserPropertyKey.gender`: User gender. Value must be one of: 'male', 'female', 'other'.
  /// `ApphudUserPropertyKey.cohort`: User install cohort. Value must be String.
  ///
  /// - parameter [key] is required. Initialize class with custom string or using built-in keys. See example above.
  /// - parameter [value] is required/optional. Pass `null` to remove given property from Apphud.
  /// - parameter [setOnce] is optional. Pass `true` to make this property non-updatable.
  static Future<void> setUserProperty({
    required ApphudUserPropertyKey key,
    dynamic value,
    bool setOnce = false,
  }) =>
      _channel.invokeMethod(
        'setUserProperty',
        {
          'key': key.keyName,
          'value': value,
          'setOnce': setOnce,
        },
      );

  /// Increment custom user property. Value must be one of: `int`, `float`
  ///
  /// Example:
  /// ```dart
  /// Apphud.incrementUserProperty(key: ApphudUserPropertyKey.customProperty('progress'), by: 0.5)
  /// ```
  /// - parameter [key] is required. Use your custom string key or some of built-in keys.
  /// - parameter by is required. You can pass negative value to decrement.
  static Future<void> incrementUserProperty({
    required ApphudUserPropertyKey key,
    required dynamic by,
  }) =>
      _channel.invokeMethod(
        'incrementUserProperty',
        {
          'key': key.keyName,
          'by': by,
        },
      );

// Attribution

  /// iOS only. Submit Advertising Identifier (IDFA) to Apphud.
  ///
  /// This is used to properly match user with attribution platforms (AppsFlyer, Facebook, etc.)
  static Future<void> setAdvertisingIdentifier(String idfa) =>
      _channel.invokeMethod(
        'setAdvertisingIdentifier',
        {'idfa': idfa},
      );

  ///  Submit attribution data to Apphud from your attribution network provider.
  ///
  /// - parameter [data] is optional. Attribution 'map'.
  /// - parameter [provider] is required. Attribution provider name. Available values: `ApphudAttributionProvider.appsFlyer`, `ApphudAttributionProvider.adjust`, `ApphudAttributionProvider.appleSearchAds`, `ApphudAttributionProvider.firebase`.
  /// - parameter [identifier] is optional. Identifier that matches Apphud and Attribution provider. Required for AppsFlyer.
  /// Returns true if successfully sent.
  static Future<bool> addAttribution({
    Map<String, dynamic>? data,
    required ApphudAttributionProvider provider,
    String? identifier,
  }) async {
    if (data == null && identifier == null) {
      return Future.error(
        'Please provide \'data\' or \'identifier\' or both parameters',
      );
    }
    final bool isAdded = await _channel.invokeMethod('addAttribution', {
      'data': data,
      'from': provider.convertToString,
      'identifier': identifier
    });
    return isAdded;
  }

  /// iOS only. Send search ads attribution data to Apphud.
  ///
  /// Returns [ApphudError] if an error occurred or null otherwise.
  static Future<ApphudError?> collectSearchAdsAttribution() async {
    final Map<dynamic, dynamic>? result =
        (await _channel.invokeMethod('collectSearchAdsAttribution'));
    return result != null ? ApphudError.fromJson(result) : null;
  }

  // Other

  /// Enables debug logs. You should call this method before SDK initialization.
  ///
  /// - [iOS] only parameter [level] is optional. Default value is [ApphudDebugLevel.low].
  /// The value [ApphudDebugLevel.high] enables printing of additional debug messages, for example HTTP requests and responses
  static Future<void> enableDebugLogs({
    ApphudDebugLevel level = ApphudDebugLevel.low,
  }) =>
      _channel.invokeMethod('enableDebugLogs', {
        'level': level == ApphudDebugLevel.low ? 0 : 1,
      });

  /// Android only. Must be called before SDK initialization.
  ///
  /// If called, some user parameters like Advertising ID, Android ID,
  /// App Set ID, Device Type, IP address will not be tracked by Apphud.
  static Future<void> optOutOfTracking() =>
      _channel.invokeMethod('optOutOfTracking');

  /// Android only. Collects device identifiers that are required for some third-party integrations,
  /// like AppsFlyer, Adjust, Singular, etc.
  ///
  /// Identifiers include Advertising ID, Android ID, App Set ID.
  /// When targeting Android 13 and above, you must declare AD_ID permission
  /// in the manifest file: https://support.google.com/googleplay/android-developer/answer/6048248?hl=en
  /// Be sure optOutOfTracking() not called before. Otherwise device identifiers will not be collected.
  static Future<void> collectDeviceIdentifiers() =>
      _channel.invokeMethod('collectDeviceIdentifiers');

  // Promotionals

  /// You can grant free promotional subscription to user. Returns `true` in a callback if promotional was granted.
  ///
  /// You should pass either `productId` (recommended) or `permissionGroup` OR both parameters `null`. Sending both `productId` and `permissionGroup` parameters will result in `productId` being used.
  /// - parameter [daysCount] is required. Number of days of free premium usage. For lifetime promotionals just pass extremely high value, like 10000.
  /// - parameter [productId] is optional. Recommended. Product Id of promotional subscription.
  /// - parameter [permissionGroup] is optional. Permission Group of promotional subscription. Use this parameter in case you have multiple permission groups.
  static Future<bool> grantPromotional({
    required int daysCount,
    String? productId,
    ApphudGroup? group,
  }) async {
    final bool? value = await _channel.invokeMethod<bool>(
      'grantPromotional',
      {
        'daysCount': daysCount,
        'productId': productId,
        'permissionGroupName': group?.name,
      },
    );
    return value!;
  }
}
