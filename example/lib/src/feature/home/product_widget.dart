import 'dart:io';

import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:apphud_example/src/feature/home/sk_product_widget.dart';
import 'package:apphud_example/src/feature/home/sku_details_widget.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatelessWidget {
  final ApphudProductComposite product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SkProductWidget(
        skProduct: product.skProductWrapper,
        onTap: () => _purchaseProduct(
          context,
          product.skProductWrapper?.productIdentifier,
        ),
      );
    } else if (Platform.isAndroid) {
      return SkuDetailsWidget(
        skuDetails: product.skuDetailsWrapper,
        onTap: () => _purchaseProduct(
          context,
          product.skuDetailsWrapper?.sku,
        ),
      );
    }
    return Card(child: ListTile(title: Text('No product for this platform')));
  }

  void _purchaseProduct(BuildContext context, String? id) {
    if (id != null) {
      BlocProvider.of<PurchaseBloc>(context).add(PurchaseEvent.purchase(id));
    }
  }
}
