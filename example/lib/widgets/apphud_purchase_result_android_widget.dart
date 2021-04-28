import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/android/apphud_purchase_result_android.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'package:flutter/material.dart';

class ApphudPurchaseResultAndroidWidget extends StatelessWidget {
  final List<ApphudPurchaseResultAndroid>? resultAndroid;

  const ApphudPurchaseResultAndroidWidget({Key? key, this.resultAndroid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resultAndroid == null)
      return CardWrapper(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Not existing product'),
          ),
        ),
      );

    return _buildResultAndroidList(resultAndroid!);
  }

  _buildResultAndroidList(
    List<ApphudPurchaseResultAndroid> resultAndroidList,
  ) {
    return ListView(
      children: resultAndroidList
          .map((result) => CardWrapper(child: _buildResultAndroid(result)))
          .toList(),
    );
  }

  Widget _buildResultAndroid(ApphudPurchaseResultAndroid resultAndroid) {
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
            subtitle: Text(resultAndroid.sku),
          ),
        ),
        ListTile(
          title: Text("packageName"),
          subtitle: Text(resultAndroid.packageName),
        ),
        ListTile(
          title: Text("orderId"),
          subtitle: Text(resultAndroid.orderId),
        ),
        ListTile(
          title: Text("purchaseToken"),
          subtitle: Text(resultAndroid.purchaseToken),
        ),
        ListTile(
          title: Text("signature"),
          subtitle: Text(resultAndroid.signature),
        ),
        ListTile(
          title: Text("originalJson"),
          subtitle: Text(resultAndroid.originalJson),
        ),
        ListTile(
          title: Text("purchaseState"),
          subtitle: Text('${resultAndroid.purchaseState}'),
        ),
        ListTile(
          title: Text("purchaseTime"),
          subtitle: Text('${resultAndroid.purchaseTime}'),
        ),
      ],
    );
  }
}
