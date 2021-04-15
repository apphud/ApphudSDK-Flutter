import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/material.dart';

import 'sk_product_widget.dart';

class SKProductListWidget extends StatelessWidget {
  final Future<List<SKProductWrapper>> future;

  const SKProductListWidget({Key? key, required this.future}) : super(key: key);

  Widget build(BuildContext context) {
    return FutureBuilder<List<SKProductWrapper>>(
      future: future,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<SKProductWrapper>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Expanded(child: _buildProductList(snapshot));
          }
        }
        return Text('Waiting...');
      },
    );
  }

  Widget _buildProductList(AsyncSnapshot<List<SKProductWrapper>> snapshot) {
    if (snapshot.data?.isEmpty ?? true) return Center(child: Text('No items'));

    final List<SKProductWrapper> products = snapshot.data!;
    return ListView(
      children: products
          .map((SKProductWrapper skProduct) =>
              SKProductWidget(skProduct: skProduct))
          .toList(),
    );
  }
}
