import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud_example/src/feature/common/widgets/ink_well_stack.dart';
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
    final SKProductWrapper skProductLocal = skProduct!;
    return InkWell(
      onTap: onTap,
      child: _wrapInCard(
        child: ListTile(
          title: Text(
            '${skProductLocal.localizedTitle} '
            '(${skProductLocal.productIdentifier})',
          ),
          leading: Text(
              '${skProductLocal.price} ${skProductLocal.priceLocale.currencyCode}'),
          subtitle: Text(skProductLocal.localizedDescription),
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

  Widget _wrapInCard({required Widget child}) {
    if (wrapInCard) {
      return Card(elevation: 5, child: child);
    }
    return child;
  }
}
