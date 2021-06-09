import 'dart:io';

import 'package:apphud/models/apphud_models/apphud_paywall_product.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:apphud_example/src/feature/common/widgets/ink_well_stack.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkProductWidget extends StatelessWidget {
  final SKProductWrapper? skProduct;
  final VoidCallback? onTap;

  const SkProductWidget({
    Key? key,
    this.skProduct,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (skProduct == null) {
      return Card(child: ListTile(title: Text('skProduct is null')));
    }
    final SKProductWrapper skProductLocal = skProduct!;
    return InkWellStack(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(
            '${skProductLocal.localizedTitle} '
            '(${skProductLocal.productIdentifier})',
          ),
          leading: Text(
              '${skProductLocal.price} ${skProductLocal.priceLocale.currencyCode}'),
          subtitle: Text(skProductLocal.localizedDescription),
        ),
      ),
    );
  }
}
