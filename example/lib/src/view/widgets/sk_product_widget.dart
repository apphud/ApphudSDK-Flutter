import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/material.dart';

class SkProductWidget extends StatelessWidget {
  final SKProductWrapper? skProduct;
  final VoidCallback? onTap;
  final VoidCallback? onPromote;
  final bool wrapInCard;

  const SkProductWidget({
    Key? key,
    this.skProduct,
    this.onTap,
    this.onPromote,
    bool? wrapInCard,
  })  : wrapInCard = wrapInCard ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (skProduct == null) {
      return _wrapInCard(child: ListTile(title: Text('skProduct is null')));
    }
    final skProductLocal = skProduct!;
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: _wrapInCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skProductLocal.localizedTitle,
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      skProductLocal.productIdentifier,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      skProductLocal.localizedDescription,
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${skProductLocal.price} ${skProductLocal.priceLocale.currencyCode}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
        ),
      ),
    );
  }

  Widget _wrapInCard({required Widget child}) {
    if (wrapInCard) {
      return Card(elevation: 1, child: child);
    }
    return child;
  }
}
