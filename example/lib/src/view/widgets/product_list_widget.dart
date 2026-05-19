import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/sk_product/discount_type_wrapper.dart';
import 'package:apphud/models/sk_product/discount_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/overlay_progress_indicator.dart';
import 'package:apphud_example/src/view/widgets/pretty_json_dialog.dart';
import 'package:apphud_example/src/view/widgets/sk_product_widget.dart';
import 'package:apphud_example/src/view/widgets/sku_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListWidget extends StatelessWidget {
  final List<ApphudProduct>? products;

  const ProductListWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((products?.length ?? 0) == 0) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'No products to purchase',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }
    return _buildProductList(products!, context);
  }

  Widget _buildProductList(List<ApphudProduct> products, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        children: products
            .map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _buildProduct(p, context),
                ))
            .toList(),
      ),
    );
  }

  void _showProductProperties(BuildContext context, ApphudProduct product) {
    showPrettyJsonDialog(
      context,
      'Properties · ${product.productId}',
      product.properties ?? const {},
    );
  }

  Widget _buildProduct(ApphudProduct product, BuildContext context) {
    Widget content;
    if (Platform.isIOS) {
      content = SkProductWidget(
        skProduct: product.skProduct,
        wrapInCard: false,
        onTap: () => _onIosProductTap(context, product),
        onPromote: () => BlocProvider.of<PurchaseBloc>(context).add(
          PurchaseEvent.grantPromotional(product),
        ),
        onShowProperties: () => _showProductProperties(context, product),
      );
    } else if (Platform.isAndroid) {
      content = ProductDetailsWidget(
        wrapInCard: false,
        productDetails: product.productDetails,
        onTap: () => BlocProvider.of<PurchaseBloc>(context).add(
          PurchaseEvent.purchaseProduct(product),
        ),
        onPromote: () => BlocProvider.of<PurchaseBloc>(context).add(
          PurchaseEvent.grantPromotional(product),
        ),
        onShowProperties: () => _showProductProperties(context, product),
      );
    } else {
      content = Text('No product for this platform');
    }
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              product.name ?? 'No name',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            content,
          ],
        ),
      ),
    );
  }

  Future<void> _onIosProductTap(
    BuildContext context,
    ApphudProduct product,
  ) async {
    final bloc = BlocProvider.of<PurchaseBloc>(context);
    final promoOffers = _promoOffers(product.skProduct);

    if (promoOffers.isEmpty) {
      bloc.add(PurchaseEvent.purchaseProduct(product));
      return;
    }

    final loading = OverlayProgressIndicatorEntry()..insert(context);
    bool introEligible = false;
    bool promoEligible = false;
    try {
      final results = await Future.wait([
        Apphud.checkEligibilityForIntroductoryOffer(productId: product.productId),
        Apphud.checkEligibilityForPromotionalOffer(productId: product.productId),
      ]);
      introEligible = results[0];
      promoEligible = results[1];
    } finally {
      loading.remove();
    }

    if (!context.mounted) return;

    final selection = await showDialog<_PromoChoice>(
      context: context,
      builder: (_) => _PromoOfferDialog(
        product: product,
        offers: promoOffers,
        introEligible: introEligible,
        promoEligible: promoEligible,
      ),
    );

    if (selection == null) return;
    if (selection.discountID == null) {
      bloc.add(PurchaseEvent.purchaseProduct(product));
    } else {
      bloc.add(
        PurchaseEvent.purchasePromo(
          product: product,
          discountID: selection.discountID!,
        ),
      );
    }
  }

  /// Returns only promotional ("subscription") offers with a non-null
  /// `identifier`. Introductory offers (free trial / pay-as-you-go) cannot be
  /// purchased via `purchasePromo` — they auto-apply on first subscription.
  List<SKProductDiscountWrapper> _promoOffers(SKProductWrapper? skProduct) {
    if (skProduct == null) return const [];
    return skProduct.discounts
        .where((d) =>
            d.type == SKProductDiscountType.subscription &&
            (d.identifier?.isNotEmpty ?? false))
        .toList(growable: false);
  }
}

class _PromoChoice {
  final String? discountID;
  const _PromoChoice.withoutDiscount() : discountID = null;
  const _PromoChoice.withDiscount(String id) : discountID = id;
}

class _PromoOfferDialog extends StatelessWidget {
  final ApphudProduct product;
  final List<SKProductDiscountWrapper> offers;

  /// Whether this user can still consume the introductory offer
  /// (free trial / pay-as-you-go). Drives the "Purchase ..." label at the
  /// bottom of the dialog.
  final bool introEligible;

  /// Whether this user is eligible for promotional offers on this product.
  /// Apple's eligibility is per-product, not per-offer, so this single flag
  /// applies to every promotional offer in the list.
  final bool promoEligible;

  const _PromoOfferDialog({
    required this.product,
    required this.offers,
    required this.introEligible,
    required this.promoEligible,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final productId = product.skProduct?.productIdentifier ?? product.productId;
    final productTitle = product.skProduct?.localizedTitle ?? product.name;
    final regularLabel = Apphud.isCommitmentPlanPreferred(product)
        ? 'Purchase with commitment'
        : introEligible
            ? 'Purchase introductory offer'
            : 'Purchase with standard price';
    final regularLabelStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w700,
    );

    final maxHeight = MediaQuery.sizeOf(context).height * 0.72;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400, maxHeight: maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              color: colorScheme.primaryContainer.withOpacity( 0.35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.local_offer_outlined,
                    color: colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose offer',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (productTitle != null && productTitle.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            productTitle,
                            style: theme.textTheme.titleSmall,
                          ),
                        ],
                        const SizedBox(height: 2),
                        Text(
                          productId,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (offers.isNotEmpty) ...[
                      Text(
                        'Promotional offers',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...offers.map(
                        (offer) => _PromoOfferBullet(
                          offer: offer,
                          enabled: promoEligible,
                          onTap: promoEligible
                              ? () => Navigator.of(context).pop(
                                    _PromoChoice.withDiscount(offer.identifier!),
                                  )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    Text(
                      'Standard purchase',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Material(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.of(context).pop(
                          const _PromoChoice.withoutDiscount(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  regularLabel,
                                  style: regularLabelStyle,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

String _promoOfferSubtitle(SKProductDiscountWrapper offer) {
  final currency = offer.priceLocale.currencyCode ?? '';
  final period = offer.subscriptionPeriod;
  final unit = period.unit.name;
  final units = period.numberOfUnits;
  final periods = offer.numberOfPeriods;
  final mode = offer.paymentMode.name;
  return '${offer.price} $currency · $units $unit × $periods · $mode';
}

class _PromoOfferBullet extends StatelessWidget {
  final SKProductDiscountWrapper offer;
  final bool enabled;
  final VoidCallback? onTap;

  const _PromoOfferBullet({
    required this.offer,
    required this.enabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final identifier = offer.identifier ?? '—';
    final title = enabled ? identifier : '$identifier (unavailable)';
    final subtitle = _promoOfferSubtitle(offer);

    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            '•',
            style: theme.textTheme.titleLarge?.copyWith(
              height: 1,
              color: enabled
                  ? colorScheme.primary
                  : colorScheme.onSurface.withOpacity( 0.38),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: enabled ? null : colorScheme.onSurface.withOpacity( 0.38),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: enabled
                      ? colorScheme.onSurfaceVariant
                      : colorScheme.onSurface.withOpacity( 0.38),
                ),
              ),
            ],
          ),
        ),
        if (enabled)
          Icon(
            Icons.chevron_right,
            size: 20,
            color: colorScheme.onSurfaceVariant,
          ),
      ],
    );

    if (!enabled) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Opacity(opacity: 0.65, child: content),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: content,
          ),
        ),
      ),
    );
  }
}
