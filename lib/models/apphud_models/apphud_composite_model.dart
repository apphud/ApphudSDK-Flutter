import '../mapper.dart';
import 'apphud_non_renewing_purchase.dart';
import 'apphud_subscription.dart';

class ApphudComposite {
  List<ApphudNonRenewingPurchase> purchases;
  List<ApphudSubscriptionWrapper> subscriptions;

  ApphudComposite({this.purchases, this.subscriptions});

  factory ApphudComposite.fromJson(Map map) {
    List<dynamic> purchasesJsons = map["nrPurchases"];
    List<dynamic> subscriptionsJsons = map["subscriptions"];

    List<ApphudNonRenewingPurchase> purchases;
    if (purchasesJsons != null) {
      purchases = purchasesJsons
          .map((json) => Mapper.apphudNonRenewingPurchaseFromJson(json))
          .toList();
    } else {
      purchases = List<ApphudNonRenewingPurchase>();
    }

    List<ApphudSubscriptionWrapper> subscriptions;
    if (subscriptionsJsons != null) {
      subscriptions = subscriptionsJsons
          .map((json) => Mapper.apphudSubscriptionWrapperFromJson(json))
          .toList();
    } else {
      subscriptions = List<ApphudSubscriptionWrapper>();
    }

    return ApphudComposite(purchases: purchases, subscriptions: subscriptions);
  }
}
