import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'package:flutter/material.dart';

class ApphudPurchaseResultIosWidget extends StatelessWidget {
  final ApphudPurchaseResultIos? resultIos;

  const ApphudPurchaseResultIosWidget({Key? key, this.resultIos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = resultIos == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Not existing product'),
            ),
          )
        : _buildResultIos(resultIos!);

    return CardWrapper(child: content);
  }

  _buildResultIos(ApphudPurchaseResultIos resultIos) {
    return SingleChildScrollView(
      child: Column(
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
              title: Text("Subscription"),
              subtitle: Text(resultIos.subscription?.toString() ?? "null"),
            ),
          ),
          ListTile(
            title: Text("Transaction"),
            subtitle: Text(resultIos.transaction?.toString() ?? "null"),
          ),
          ListTile(
            title: Text("NonRenewingPurchase"),
            subtitle: Text(resultIos.nonRenewingPurchase?.toString() ?? "null"),
          ),
        ],
      ),
    );
  }
}
