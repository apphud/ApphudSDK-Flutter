import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:flutter/material.dart';

import 'product_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ApphudProduct> productList;

  const ProductListWidget({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productList.isEmpty) {
      return Center(child: Text('No products to purchase'));
    }
    return ListView.builder(
      itemBuilder: (_, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductWidget(product: productList[index]),
      ),
      itemCount: productList.length,
    );
  }
}
