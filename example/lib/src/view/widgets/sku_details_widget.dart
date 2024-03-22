import 'dart:convert';

import 'package:apphud/models/product_details/product_details_wrapper.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductDetailsWrapper? productDetails;
  final VoidCallback? onTap;
  final VoidCallback? onPromote;
  final bool wrapInCard;

  const ProductDetailsWidget({
    Key? key,
    this.productDetails,
    this.onTap,
    this.onPromote,
    bool? wrapInCard,
  })  : wrapInCard = wrapInCard ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productDetails == null) {
      return _wrapInCard(
          child: ListTile(title: Text('productDetails is null')));
    }
    final ProductDetailsWrapper productDetailsLocal = productDetails!;
    return InkWell(
      onTap: onTap,
      child: _wrapInCard(
        child: ListTile(
          title: Text('${productDetailsLocal.description}\n'
              '${productDetailsLocal.title} (${productDetailsLocal.productId})'),
          subtitle: _buildProductDetailsJson(productDetailsLocal),
          trailing: HeroMode(
            enabled: false,
            child: FloatingActionButton(
              onPressed: onPromote,
              child: Text('P'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailsJson(ProductDetailsWrapper productDetails) {
    final JsonEncoder encoder = JsonEncoder.withIndent(' ');
    final oneTimePurchaseOfferDetails = encoder.convert(
      productDetails.oneTimePurchaseOfferDetails,
    );

    final subscriptionOfferDetails = productDetails.subscriptionOfferDetails
            ?.map((d) => Text(encoder.convert(d)))
            .toList(growable: false) ??
        <Widget>[];

    return Column(
      children: [
        Text(oneTimePurchaseOfferDetails),
        ...subscriptionOfferDetails,
      ],
    );
  }

  Widget _wrapInCard({required Widget child}) {
    if (wrapInCard) {
      return Card(elevation: 5, child: child);
    }
    return child;
  }
}
