## 2.0.6 
- Paywalls features were implemented:
    - method getPaywalls() [iOS], [Android]
    - method permissionGroups() [iOS], [Android]
    - method purchase({ ApphudProduct? product }) [iOS], [Android]
    - method paywallShown(ApphudPaywall paywall) [iOS]  
    - method paywallClosed(ApphudPaywall paywall) [iOS]
    
- Bugs were fixed:
    - Method getPaywalls() always returns result with error [Android]

- Dependencies of Native SDK's were updated to:
    - [Android] 1.1.0
    - [iOS] 2.1.1
      
- **BREAKING** refactor [iOS], [Android]:
    - AppHud class was renamed to Apphud
    - ApphudProduct was renamed to ApphudProductComposite and was marked as deprecated
    - Method purchase(String productId) -> purchase({String? productId}). Parameter productId was marked as deprecated
   
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

