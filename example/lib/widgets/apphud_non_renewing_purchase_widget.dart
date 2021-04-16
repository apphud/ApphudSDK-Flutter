import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/material.dart';

class ApphudNonRenewingPurchaseWidget extends StatelessWidget {
  final ApphudNonRenewingPurchase purchase;

  const ApphudNonRenewingPurchaseWidget({Key? key, required this.purchase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ListTile(
              title: Text("productId"),
              subtitle: Text(purchase.productId),
            ),
          ),
          ListTile(
            title: Text("expiresDate"),
            subtitle: Text(purchase.purchasedAt.toString()),
          ),
          ListTile(
            title: Text("startedAt"),
            subtitle: Text(purchase.canceledAt?.toString() ?? 'null'),
          ),
        ],
      ),
    );
  }
}
