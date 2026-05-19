import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/sk_product/discount_type_wrapper.dart';
import 'package:apphud/models/sk_product/discount_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/overlay_progress_indicator.dart';
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
    final productId = product.skProduct?.productIdentifier ?? product.productId;
    final regularLabel = introEligible
        ? 'Purchase introductory offer'
        : 'Purchase with standard price';

    return AlertDialog(
      title: Text('Choose offer'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              productId,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            ...offers.map((offer) {
              final title = promoEligible
                  ? (offer.identifier ?? '—')
                  : '${offer.identifier ?? '—'} (unavailable)';
              return ListTile(
                dense: true,
                enabled: promoEligible,
                title: Text(title),
                subtitle: Text(_offerSubtitle(offer)),
                onTap: promoEligible
                    ? () => Navigator.of(context).pop(
                          _PromoChoice.withDiscount(offer.identifier!),
                        )
                    : null,
              );
            }),
            const Divider(),
            ListTile(
              dense: true,
              title: Text(regularLabel),
              onTap: () => Navigator.of(context).pop(
                const _PromoChoice.withoutDiscount(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ],
    );
  }

  String _offerSubtitle(SKProductDiscountWrapper offer) {
    final currency = offer.priceLocale.currencyCode ?? '';
    final period = offer.subscriptionPeriod;
    final unit = period.unit.name;
    final units = period.numberOfUnits;
    final periods = offer.numberOfPeriods;
    final mode = offer.paymentMode.name;
    return '${offer.price} $currency · $units $unit × $periods · $mode';
  }
}
