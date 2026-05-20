import 'dart:convert';

import 'package:apphud/models/product_details/product_details_wrapper.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductDetailsWrapper? productDetails;
  final VoidCallback? onTap;
  final VoidCallback? onPromote;
  final VoidCallback? onShowProperties;
  final bool wrapInCard;

  const ProductDetailsWidget({
    Key? key,
    this.productDetails,
    this.onTap,
    this.onPromote,
    this.onShowProperties,
    bool? wrapInCard,
  })  : wrapInCard = wrapInCard ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productDetails == null) {
      return _wrapInCard(
        child: ListTile(title: Text('productDetails is null')),
      );
    }
    final details = productDetails!;
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: _wrapInCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details.title,
                          style: theme.textTheme.titleSmall,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          details.productId,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          details.description,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onShowProperties,
                        child: const Text('Props'),
                      ),
                      Tooltip(
                        message: 'Grant promotional access for 1 day',
                        child: TextButton(
                          onPressed: onPromote,
                          child: const Text('Grant 1d free'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildProductDetailsJson(details, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailsJson(
    ProductDetailsWrapper productDetails,
    ThemeData theme,
  ) {
    final encoder = JsonEncoder.withIndent(' ');
    final oneTimePurchaseOfferDetails = encoder.convert(
      productDetails.oneTimePurchaseOfferDetails,
    );

    final subscriptionOfferDetails = productDetails.subscriptionOfferDetails
            ?.map(
              (d) => Text(
                encoder.convert(d),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  fontSize: 11,
                ),
              ),
            )
            .toList(growable: false) ??
        <Widget>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          oneTimePurchaseOfferDetails,
          style: theme.textTheme.bodySmall?.copyWith(
            fontFamily: 'monospace',
            fontSize: 11,
          ),
        ),
        ...subscriptionOfferDetails,
      ],
    );
  }

  Widget _wrapInCard({required Widget child}) {
    if (wrapInCard) {
      return Card(elevation: 1, child: child);
    }
    return child;
  }
}
