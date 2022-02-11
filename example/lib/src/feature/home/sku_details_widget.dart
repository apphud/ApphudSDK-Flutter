import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:apphud_example/src/feature/common/widgets/ink_well_stack.dart';
import 'package:flutter/material.dart';

class SkuDetailsWidget extends StatelessWidget {
  final SkuDetailsWrapper? skuDetails;
  final VoidCallback? onTap;
  final VoidCallback? onPromote;
  final bool wrapInCard;

  const SkuDetailsWidget({
    Key? key,
    this.skuDetails,
    this.onTap,
    this.onPromote,
    bool? wrapInCard,
  })  : wrapInCard = wrapInCard ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (skuDetails == null) {
      return _wrapInCard(child: ListTile(title: Text('skuDetails is null')));
    }
    final SkuDetailsWrapper skuDetailsLocal = skuDetails!;
    return InkWell(
      onTap: onTap,
      child: _wrapInCard(
        child: ListTile(
          title: Text('${skuDetailsLocal.title} (${skuDetailsLocal.sku})'),
          leading: Text(skuDetailsLocal.price),
          subtitle: Text(skuDetailsLocal.description),
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
