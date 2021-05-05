import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/android/android_purchase_wrapper.dart';
import 'package:flutter/material.dart';

class AndroidPurchaseWidget extends StatelessWidget {
  final AndroidPurchaseWrapper? purchase;

  const AndroidPurchaseWidget({Key? key, this.purchase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (purchase == null)
      return CardWrapper(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('AndroidPurchaseWrapper not present'),
          ),
        ),
      );

    return CardWrapper(child: _buildResultAndroidList(purchase!));
  }

  _buildResultAndroidList(AndroidPurchaseWrapper purchase) {
    return Column(
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
            title: Text("sku"),
            subtitle: Text(purchase.sku),
          ),
        ),
        ListTile(
          title: Text("packageName"),
          subtitle: Text(purchase.packageName),
        ),
        ListTile(
          title: Text("orderId"),
          subtitle: Text(purchase.orderId),
        ),
        ListTile(
          title: Text("purchaseToken"),
          subtitle: Text(purchase.purchaseToken),
        ),
        ListTile(
          title: Text("signature"),
          subtitle: Text(purchase.signature),
        ),
        ListTile(
          title: Text("originalJson"),
          subtitle: Text(purchase.originalJson),
        ),
        ListTile(
          title: Text("purchaseState"),
          subtitle: Text('${purchase.purchaseState}'),
        ),
        ListTile(
          title: Text("purchaseTime"),
          subtitle: Text('${purchase.purchaseTime}'),
        ),
      ],
    );
  }
}
