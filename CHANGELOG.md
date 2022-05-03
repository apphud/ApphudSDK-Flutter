### 2.2.2
- [iOS], [Android] Method `hasPremiumAccess()` was implemented.
- [Android] The parameter `paywallIdentifier` was introduced for the method `syncPurchases()`.
- [iOS] The method `didPurchaseFromPaywall` was implemented.

- Dependencies of Native SDK's were updated to:
  - [Android] 1.5.9
  - [iOS] 2.8.1

## 2.2.1
- [Android] Fixed bug that method hasActiveSubscription was false for paying users at launch before data refreshes. Now value is cached.
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
    - 'ApphudDebugLevel.high' - enables printing of additional debug messages, for example HTTP requests and responses.
- [iOS], [Android] Automatic fetching of Apphud Flutter SDK version was implemented
- [iOS] **BREAKING** Method 'disableIDFACollection()' was removed
- [Android] Method 'grantPromotional()' was implemented
- [Android], [iOS] Class 'ApphudListener' and method 'setListener({ApphudListener? listener})' were implemented
- [Android], [iOS] **BREAKING** Method 'getPaywalls()' was removed. Please use ApphudListener instead.
- [iOS] **BREAKING** Method 'paywallsDidLoadCallback()' was removed. Please use ApphudListener instead.
- [Android] Method 'deviceId()' was implemented
- [Andoid], [iOS] Significantly improved SDK performance and caching. Now SDK will send much less requests to Apphud server.

 
- Dependencies of Native SDK's were updated to:
    - [Android] 1.5.3
    - [iOS] 2.5.6
    
## 2.1.0
- [iOS], [Android] Experiments were added. Run Experiments(A/B tests) to test different in-app purchases prices in order to find the best.
- [iOS] Apple search Ads logic was improved. Submit Apple Attribution Token to Apphud with Apphud.addAttribution().
- [iOS] Paywalls methods was improved. Paywalls are already exist after SDK initialization. Use paywalls() method.
- [iOS] paywallsDidLoadCallback() method was added. This callback is called when paywalls are fully loaded with their StoreKit products.
- [iOS] Promotionals were added. You can grant free promotional subscription to user with new method grantPromotional()
- [iOS] Fixed important bug when User Properties sometimes may not be saved when submitted simultaneously with initialisation.
- [iOS] Fixed a bug when incoming rules did not automatically mark as read.
- [Android] Paywalls events methods were implemented: paywallShown(), paywallClosed()
- [Android] Supporting of Google Billing library 4.0 was implemented
- [iOS], [Android] Properties 'experimentName' and 'variationName' were added to ApphudPaywall.
- [iOS], [Android] Bug fixing and some internal improvements.
- [iOS], [Android] Products list was removed from Example app because of deprecation due to Paywalls. 

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
    - Method purchase(String productId) -> purchase({String? productId}). Parameter productId was marked as deprecated

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

