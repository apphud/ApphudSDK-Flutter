import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/sk_product/sk_payment_transaction_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/material.dart';

class SKPaymentTransactionWidget extends StatelessWidget {
  final SKPaymentTransactionWrapper? transaction;

  const SKPaymentTransactionWidget({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = transaction == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('SKPaymentTransactionWrapper not present'),
            ),
          )
        : _buildResult(transaction!);

    return CardWrapper(child: content);
  }

  _buildResult(SKPaymentTransactionWrapper transaction) {
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
              title: Text("transactionIdentifier"),
              subtitle: Text(transaction.transactionIdentifier ?? 'null'),
            ),
          ),
          ListTile(
            title: Text("transactionDate"),
            subtitle: Text(transaction.transactionDate?.toString() ?? 'null'),
          ),
          ListTile(
            title: Text("payment"),
            subtitle: Text(transaction.payment?.toString() ?? 'null'),
          ),
        ],
      ),
    );
  }
}
