## 2.6.1

- **BREAKING** [iOS], [Android] `addAttribution` method was renamed to `setAttribution`

- Dependencies of Native SDK's were updated to:
  - [Android] 2.9.1
  - [iOS] 3.6.2

## 2.6.0

- **BREAKING** [Android] `ApphudListener.apphudDidReceivePurchase` method was introduced
- **BREAKING** [iOS], [Android] `paywalls` method was removed
- **BREAKING** [iOS] `rawPaywalls` method was removed
- [Android] `ApphudNonRenewingPurchase.purchaseToken` property was introduced
- [Android] `ApphudSubscription.purchaseToken` property was introduced
- [Android], [iOS] `deferPlacements` method was introduced
- [Android] `refreshUserData` method was introduced
- [Android], [iOS] `forceFlushUserProperties` method was introduced
- [Android]  `refreshUserData` now returns `ApphudUser?`
- [Android]  `updateUserID` now returns `ApphudUser?`
- [Android], [iOS] `attributeFromWeb` method was introduced

- Dependencies of Native SDK's were updated to:
  - [Android] 2.8.3
  - [iOS] 3.5.6

## 2.5.4

- [iOS],[Android] `ApphudAttributionProvider.facebook` was added.

## 2.5.3

- [iOS],[Android] `ApphudAttributionProvider.custom` was added.

## 2.5.2

- [Android] `trackPurchase` method was introduced.
- [Android] `syncPurchasesInObserverMode` method was deprecated. All purchases on Android are now automatically intercepted and sent to Apphud.  

- Dependencies of Native SDK's were updated to:
    - [Android] 2.7.0
    - [iOS] 3.4.0

## 2.5.1

- [iOS], [Android] Example App was refactored
- [Android] `loadFallbackPaywalls` method was introduced

- Dependencies of Native SDK's were updated to:
    - [Android] 2.6.5

## 2.5.0

- Dependencies of Native SDK's were updated to:
    - [Android] 2.6.0
    - [iOS] 3.3.6
- **BREAKING** `ApphudGroup`'s `products` variable was changed to `List<String> productIds`.
-

## 2.4.5

- Dependencies of Native SDK's were updated to:
    - [Android] 2.4.5

## 2.4.4

- [Android] **BREAKING** `Future<List<ApphudPlacement>> placementsDidLoadCallback()` renamed
  to `Future<ApphudPlacements> fetchPlacements()`
- [Android] `paywallsDidLoadCallback` call result contains optional `ApphudError`
- [Android] `refreshUserData` method was introduced
- [Android] `ApphudError` now contains `networkIssue`, `billingResponseCode` and `billingErrorTitle`
  attributes
- [iOS], [Android] `ApphudPaywall` now contains `variationName` and `parentPaywallIdentifier`
  attributes

- Dependencies of Native SDK's were updated to:
    - [Android] 2.4.2

## 2.4.3

- [Android] fixed some build issues

- Dependencies of Native SDK's were updated to:
    - [Android] 2.3.9

## 2.4.2

- [iOS] Fixed 'addAttribution' calling issue in some cases

## 2.4.1

- [Android] Fixed 'paywalls' calling issue in some cases

## 2.4.0

- Placements: Offers a strategic method to integrate paywalls throughout your app. This feature
  allows developers to position paywalls effectively in different app sections, such as onboarding
  or settings, targeting distinct user audiences. For more comprehensive information, please refer
  to our Placements guide.
- [iOS], [Android] **BREAKING** Property 'variationName' were removed from ApphudPaywall, which was
  confusing developers and lead to incorrect implementations.
- [iOS] **BREAKING** Method 'didFetchProductsNotification' was removed.
- [iOS], [Android] **BREAKING** Method 'productsDidFetchCallback' was removed.
- [iOS] **BREAKING** Method 'refreshStoreKitProducts' was removed.
- [iOS], [Android] **BREAKING** Method 'purchaseWithoutValidation' was removed.
- [iOS] **BREAKING** Method 'didPurchaseFromPaywall' was removed.
- [Android] **BREAKING** Method 'refreshEntitlements' was removed.
- [iOS] **BREAKING** Method 'validateReceipt' was removed.
- [iOS] **BREAKING** Method 'migratePurchasesIfNeeded' was removed.
- [iOS] **BREAKING** Method 'appStoreReceipt' was removed.
- [iOS] **BREAKING** Method 'fetchRawReceiptInfo' was removed.
- [iOS] **BREAKING** Method 'isSandbox' was removed.
- [Android] **BREAKING** Class 'AndroidAccountIdentifiersWrapper' was removed.
- [Android] **BREAKING** Method 'syncPurchases' was renamed to 'syncPurchasesInObserverMode'. The '
  paywallIdentifier' parameter was removed.
- [Android] **BREAKING** Class 'AndroidPurchaseWrapper' was modified.
- [Android], [iOS] **BREAKING** Class 'ApphudNonRenewingPurchase' was modified.
- [Android], [iOS] **BREAKING** Class 'ApphudPaywall' was modified.
- [Android], [iOS] **BREAKING** Class 'ApphudProduct' was modified.
- [Android], [iOS] **BREAKING** Class 'ApphudSubscriptionWrapper' was modified.
- [Android], [iOS] Method 'products' always returns 'ApphudProductComposite' list.
- [Android], [iOS] **BREAKING**  'ApphudAttributionProvider.appleSearchAds', '
  ApphudAttributionProvider.facebook' were modified.
- [Android], [iOS] some fixes of the example app
- [iOS], [Android] 'paywallsDidLoadCallback' method was introduced.
- [iOS], [Android] 'placements' method was introduced.
- [iOS], [Android] 'placement' method was introduced.
- [iOS], [Android] 'placementsDidLoadCallback' method was introduced.
- [iOS], [Android] 'rawPlacements' method was introduced.
- [iOS], [Android] 'rawPaywalls' method was introduced.
- [iOS], [Android] The 'start' and 'startManually' methods now return an ApphudUser object.
- [iOS], [Android] The 'ApphudListener' 'placementsDidFullyLoad' method was introduced.
- [iOS], [Android] **BREAKING** The 'ApphudListener' 'userDidLoad' method now returns an ApphudUser
  object.

- Dependencies of Native SDK's were updated to:
    - [Android] 2.3.7
    - [iOS] 3.2.8

## 2.3.2

- [Android] Fixed restore purchase issue in some cases

## 2.3.1

- Fixed purchase result parsing issue in some cases

## 2.3.0

- [Android] **BREAKING** SkuDetailsWrapper was replaced by ProductDetailsWrapper because of the
  migration to Billing v5.

- Dependencies of Native SDK's were updated to:
    - [Android] 2.0.0

## 2.2.15

- [iOS] PUSH notifications handling was added to the example app.
- [Android] 'optOutOfTracking' and 'collectDeviceIdentifiers' are introduced
- [Android] **BREAKING** Method `disableAdTracking` is removed.

- Dependencies of Native SDK's were updated to:
    - [Android] 1.8.0

## 2.2.14

- [Android] Fixes bug with AddAttribution for AppsFlyer provider.

## 2.2.13

- [Android] Bug fixes

- Dependencies of Native SDK's were updated to:
    - [Android] 1.7.7

## 2.2.12

- [Android] Bug fixes

- Dependencies of Native SDK's were updated to:
    - [Android] 1.7.6

## 2.2.11

- [Android] Bug fixes

- Dependencies of Native SDK's were updated to:
    - [Android] 1.7.5

## 2.2.10

- [Android] Bug fixes

- Dependencies of Native SDK's were updated to:
    - [Android] 1.7.3

## 2.2.9

- [Android] Bug fixes

- Dependencies of Native SDK's were updated to:
    - [Android] 1.7.2

## 2.2.8

- [Android] Internal improvements and bug fixes with syncing purchases

- Dependencies of Native SDK's were updated to:
    - [Android] 1.7.0

## 2.2.7

- [Android] fixed incorrect ApphudListener behaviour when the ApphudPlugin instance is created twice
  because of Firebase.
- [Android] Internal improvements.

- Dependencies of Native SDK's were updated to:
    - [Android] 1.6.5

## 2.2.6

- [iOS] Bug fix for Flutter SDK
- Dependencies of Native SDK's were updated to:
    - [iOS] 2.8.8

## 2.2.5

- [iOS], [Android] `ApphudListener`'s method `userDidLoad` is introduced.
- [iOS], [Android] **BREAKING** Method `paywallsDidLoad` of `ApphudListener` is removed.
  Please use `ApphudListener`'s methods `userDidLoad` or `paywallsDidFullyLoad` methods,
  depending on whether or not you need `SkuDetails`/`SKProducts` to be already filled in paywalls.
- [Android] Internal improvements and bug fixing.

- Dependencies of Native SDK's were updated to:
    - [Android] 1.6.4
    - [iOS] 2.8.5

## 2.2.4

- [Android] Fixed a bug when ApphudListener’s paywallsDidFullyLoad method wasn’t called in some
  cases.
- [Android] Added new method refreshEntitlements().
- [iOS] hasActiveSubscription(), hasPremiumAccess() improvements and bug fixes
- [iOS] Added purchasePromo() logging
- [iOS] Added checkTransactions logic for force receipt sending if a new transaction was found.

- Dependencies of Native SDK's were updated to:
    - [Android] 1.6.2
    - [iOS] 2.8.6

## 2.2.3

- [iOS] Payment swizzle was disabled for observer mode.
- [iOS] Improved interaction with Apple Search Ads attribution.
- [iOS] Updated methods description and improve documentation.

- Dependencies of Native SDK's were updated to:
    - [iOS] 2.8.3

## 2.2.2

- [iOS], [Android] Method `hasPremiumAccess()` was implemented.
- [Android] The parameter `paywallIdentifier` was introduced for the method `syncPurchases()`.
- [iOS] The method `didPurchaseFromPaywall` was implemented.

- Dependencies of Native SDK's were updated to:
    - [Android] 1.6.0
    - [iOS] 2.8.1

## 2.2.1

- [Android] Fixed bug that method hasActiveSubscription was false for paying users at launch before
  data refreshes. Now value is cached.
- [Android] Fixed internal potential crash
- [iOS] Fixed 403 server error bug, when user could be blocked from sever 403 error code
- [iOS] Add push token cache
- [iOS] Update general cache time
- [iOS] Update some Logs


- Dependencies of Native SDK's were updated to:
    - [Android] 1.5.5
    - [iOS] 2.5.7

## 2.2.0

- [iOS] The optional parameter 'level' was added to the method enableDebugLogs().
  Possible values are:
    - 'ApphudDebugLevel.low' - the same as previous amount of debug information.
    - 'ApphudDebugLevel.high' - enables printing of additional debug messages, for example HTTP
      requests and responses.
- [iOS], [Android] Automatic fetching of Apphud Flutter SDK version was implemented
- [iOS] **BREAKING** Method 'disableIDFACollection()' was removed
- [Android] Method 'grantPromotional()' was implemented
- [Android], [iOS] Class 'ApphudListener' and method 'setListener({ApphudListener? listener})' were
  implemented
- [Android], [iOS] **BREAKING** Method 'getPaywalls()' was removed. Please use ApphudListener
  instead.
- [iOS] **BREAKING** Method 'paywallsDidLoadCallback()' was removed. Please use ApphudListener
  instead.
- [Android] Method 'deviceId()' was implemented
- [Andoid], [iOS] Significantly improved SDK performance and caching. Now SDK will send much less
  requests to Apphud server.


- Dependencies of Native SDK's were updated to:
    - [Android] 1.5.3
    - [iOS] 2.5.6

## 2.1.0

- [iOS], [Android] Experiments were added. Run Experiments(A/B tests) to test different in-app
  purchases prices in order to find the best.
- [iOS] Apple search Ads logic was improved. Submit Apple Attribution Token to Apphud with
  Apphud.addAttribution().
- [iOS] Paywalls methods was improved. Paywalls are already exist after SDK initialization. Use
  paywalls() method.
- [iOS] paywallsDidLoadCallback() method was added. This callback is called when paywalls are fully
  loaded with their StoreKit products.
- [iOS] Promotionals were added. You can grant free promotional subscription to user with new method
  grantPromotional()
- [iOS] Fixed important bug when User Properties sometimes may not be saved when submitted
  simultaneously with initialisation.
- [iOS] Fixed a bug when incoming rules did not automatically mark as read.
- [Android] Paywalls events methods were implemented: paywallShown(), paywallClosed()
- [Android] Supporting of Google Billing library 4.0 was implemented
- [iOS], [Android] Properties 'experimentName' and 'variationName' were added to ApphudPaywall.
- [iOS], [Android] Bug fixing and some internal improvements.
- [iOS], [Android] Products list was removed from Example app because of deprecation due to
  Paywalls.

- **BREAKING** refactor [iOS], [Android]:
    - 'name' property was removed from ApphudPaywall

- Dependencies of Native SDK's were updated to:
    - [Android] 1.3.3
    - [iOS] 2.4.4

## 2.0.6

- Paywalls features were implemented:
    - method getPaywalls() [iOS], [Android]
    - method permissionGroups() [iOS], [Android]
    - method purchase({ ApphudProduct? product }) [iOS], [Android]
    - method paywallShown(ApphudPaywall paywall) [iOS]
    - method paywallClosed(ApphudPaywall paywall) [iOS]

- Bugs were fixed:
    - Method restorePurchases() always returns result with error [Android]

- Dependencies of Native SDK's were updated to:
    - [Android] 1.1.3
    - [iOS] 2.1.1

- **BREAKING** refactor [iOS], [Android]:
    - AppHud class was renamed to Apphud
    - ApphudProduct was renamed to ApphudProductComposite and was marked as deprecated
    - Method purchase(String productId) -> purchase({String? productId}). Parameter productId was
      marked as deprecated

- Methods are deprecated:
    - didFetchProductsNotification()
    - refreshStoreKitProducts()
    - product()
    - products()

## 2.0.5

- [iOS] Add method collectSearchAdsAttribution() to send search ads attribution data to Apphud.

## 2.0.4

- Update collection dependency
- Correct readme.md

## 2.0.3

- Upgrade the example application

## 2.0.2

- Add method documentation in apphud.dart
- [Android] Upgrade to use ApphudSDK-Android:1.0.0:
    - Add method restorePurchases
    - Modify purchase method to return ApphudPurchaseResult
- [iOS] Upgrade to use ApphudSDK 1.2.3
- Some improvements of example application

## 2.0.1

- Add methods:
    - presentOfferCodeRedemptionSheet [iOS]
    - validateReceipt [iOS]
    - appStoreReceipt [iOS]
    - setUserProperty [iOS], [Android]
    - incrementUserProperty [iOS], [Android]
    - enableDebugLogs [iOS]
    - isSandbox [iOS]
    - disableAdTracking [Android]

## 2.0.0

- **BREAKING**: refactor: migrate to null safety
    - upgrade Dart SDK constraints to >=2.12.0-0 <3.0.0
- Some improvements of example application

## 1.0.1

- [Android] Upgrade to use ApphudSDK-Android:0.8.5
- [Fixed] [Android] bugs with wrong parameters' names according to Flutter
- [iOS] Upgrade to use ApphudSDK 1.2

## 1.0.0

First version Apphud SDK for Flutter

