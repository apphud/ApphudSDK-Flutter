import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<PurchaseBloc, PurchaseState>(
      listener: _listener,
      child: _buildList(),
    );
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

  void _listener(BuildContext context, PurchaseState state) {
    final String message = state.maybeMap(
      orElse: () => '',
      purchaseSuccess: (_) => 'The purchase completed successfully',
      purchaseFailure: (f) =>
          'The purchase completed with error: ${f.error.message}'
          '${f.error.errorCode != null ? ', error code:${f.error.errorCode}' : ''}',
      restorePurchasesSuccess: (_) =>
          'The purchases restore completed successfully',
      restorePurchaseFailure: (f) =>
          'The purchases restore completed with error: ${f.error.message}'
          '${f.error.errorCode != null ? ', error code:${f.error.errorCode}' : ''}',
    );

    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
