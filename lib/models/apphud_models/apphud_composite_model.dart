import '../mapper.dart';
import 'apphud_non_renewing_purchase.dart';
import 'apphud_subscription.dart';

class ApphudComposite {
  final List<ApphudNonRenewingPurchase> purchases;
  final List<ApphudSubscriptionWrapper> subscriptions;

  ApphudComposite({required this.purchases, required this.subscriptions});

  factory ApphudComposite.fromJson(Map<dynamic, dynamic> map) {
    final List<Map<dynamic, dynamic>>? purchasesJson =
        map["nrPurchases"]?.toMapList;

    final List<Map<dynamic, dynamic>>? subscriptionsJson =
        map["subscriptions"]?.toMapList;

    final List<ApphudNonRenewingPurchase> purchases = purchasesJson != null
        ? purchasesJson
            .map((p) => ApphudNonRenewingPurchase.fromJson(p))
            .toList()
        : List<ApphudNonRenewingPurchase>.of([]);

    final List<ApphudSubscriptionWrapper> subscriptions =
        subscriptionsJson != null
            ? subscriptionsJson
                .map((s) => ApphudSubscriptionWrapper.fromJson(s))
                .toList()
            : List<ApphudSubscriptionWrapper>.of([]);

    return ApphudComposite(purchases: purchases, subscriptions: subscriptions);
  }
}
