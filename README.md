# Flutter SDK

Apphud SDK for Flutter

## Installation
##Usage

### Initialize SDK

To initialize Apphud SDK you will need SDK Token. It is a unique identifier of your Apphud application. You can get it in your Apphud application settings under General tab

Basic initialization looks like this:

```js
await AppHud.start(
          apiKey: "apiKey");
```

Initialization Options

|property|type|platform|required
|---|---|---|---|
|apiKey|String|iOS, Android|yes
|userId|String|iOS, Android|no
|deviceId|String|Android|no
|observerMode|Bool|iOS|no

You can also initialize SDK with custom Device ID. This should be used if you plan to use logout / login features. You can pass the same identifier to Device ID and User ID:
```js
await AppHud.startManually(
          apiKey: "apiKey",
          userID: "userID",
          deviceID: "deviceID",
          observerMode: true,
        );
```

Log out method will clear all saved data and reset SDK to uninitialised state:

```js
await AppHud.logout();
```

### Purchase using Apphud Billing Client

To make a purchase call:

```js
await AppHud.purchase("productId");
```

### Check Subscription Status

```js
await AppHud.hasActiveSubscription();
```

Returns true if user has active subscription. Use this method to determine whether to unlock premium functionality to the user.

### Get Products

Apphud automatically fetches SKProduct/SKDetails objects upon launch. Make sure products identifiers are added in Apphud products. To get your products call:

```js
await Apphud.products();
```

### Get Subscription Details

To get subscription object (which contains expiration date, autorenewal status, etc.) use the following method:
```js
await Apphud.subscription();
```

### Check Non-renewing Purchase Status

Use this method to check whether the user has purchased in-app purchase and it's not refunded. Returns false if was never purchased or is refunded.

```js
await Apphud.isNonRenewingPurchaseActive("productIdentifier")
```

### Get Non-renewing Purchase Details

To get non-renewing purchases, which contain purchase date, product identifier and cancellation date, use the following method:

```js
await Apphud.nonRenewingPurchases();
```

### Get User ID

To get user id you can use this method:

```js
await Apphud.userId();
```

### Integrations

Submit attribution data to Apphud from your attribution network provider.

```js
 Map<String,dynamic> data = {"key":"value"};
 ApphudAttributionProvider provider = ApphudAttributionProvider.appsFlyer;

await AppHud.addAttribution(data: data, provider: provider);
```

### Restore Purchases (only iOS)

If your app doesn't have a login system, which identifies a premium user by his credentials, then you need a "restore" mechanism.

```js
await AppHud.restorePurchases();
```
Basically it just sends App Store Receipt to Apphud and returns subscriptions (or nil, if subscriptions are never purchased), non-renewing purchases (or nil, if there are no any) and an optional error.

### Observer Mode (Android)

If you use your own billing then you should sync purchases each time user makes any purchase or restoration. Just call after purchase or restore:

```js
await Apphud.syncPurchases();
```
Keep in mind, that you are responsible for acknowledging or consuming all purchases in observer mode!

### Migrate existing purchases (Android)

If you need to migrate existing purchases in case you already have a live app or if you need to restore purchases when user hits Restore button, just call syncPurchases() method.

```js
await Apphud.syncPurchases();
```
Do not migrate purchases on every app launch. One successful time is enough. Store flag in your app if purchases were successfully migrated

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

