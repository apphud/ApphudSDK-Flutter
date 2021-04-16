import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/material.dart';

class SKProductWidget extends StatelessWidget {
  final SKProductWrapper? skProduct;

  const SKProductWidget({Key? key, this.skProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = skProduct == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Not existing product'),
            ),
          )
        : _buildProduct(skProduct!);

    return CardWrapper(child: content);
  }

  Widget _buildProduct(SKProductWrapper skProductLocal) {
    return Column(
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
            title: Text('productIdentifier'),
            subtitle: Text(skProductLocal.productIdentifier),
          ),
        ),
        ListTile(
          title: Text('localizedTitle'),
          subtitle: Text(skProductLocal.localizedTitle),
        ),
        ListTile(
          title: Text('localizedDescription'),
          subtitle: Text(skProductLocal.localizedDescription),
        ),
        ListTile(
          title: Text('priceLocale'),
          subtitle: Text(skProductLocal.priceLocale.toString()),
        ),
        ListTile(
          title: Text('subscriptionGroupIdentifier'),
          subtitle: Text(skProductLocal.subscriptionGroupIdentifier ?? 'null'),
        ),
        ListTile(
          title: Text('price'),
          subtitle: Text('${skProductLocal.price}'),
        ),
        ListTile(
          title: Text('subscriptionPeriod'),
          subtitle:
              Text(skProductLocal.subscriptionPeriod?.toString() ?? 'null'),
        ),
        ListTile(
          title: Text('introductoryPrice'),
          subtitle:
              Text(skProductLocal.introductoryPrice?.toString() ?? 'null'),
        ),
      ],
    );
  }
}
