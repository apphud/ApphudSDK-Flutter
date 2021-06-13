import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:flutter/material.dart';

import 'product_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ApphudProductComposite> productList;

  const ProductListWidget({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productList.isEmpty) {
      return Center(child: Text('No products to purchase'));
    }
    return _buildList();
  }

  ListView _buildList() {
    return ListView.builder(
      itemBuilder: (_, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductWidget(product: productList[index]),
      ),
      itemCount: productList.length,
    );
  }
}
