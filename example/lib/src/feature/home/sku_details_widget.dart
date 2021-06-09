import 'dart:io';

import 'package:apphud/models/apphud_models/apphud_paywall_product.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:apphud_example/src/feature/common/widgets/ink_well_stack.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkuDetailsWidget extends StatelessWidget {
  final SkuDetailsWrapper? skuDetails;
  final VoidCallback? onTap;

  const SkuDetailsWidget({
    Key? key,
    this.skuDetails,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (skuDetails == null) {
      return Card(child: ListTile(title: Text('skuDetails is null')));
    }
    final SkuDetailsWrapper skuDetailsLocal = skuDetails!;
    return InkWellStack(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Text('${skuDetailsLocal.title} (${skuDetailsLocal.sku})'),
          leading: Text(skuDetailsLocal.price),
          subtitle: Text(skuDetailsLocal.description),
        ),
      ),
    );
  }
}
