import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaywallsListWidget extends StatelessWidget {
  final List<ApphudPaywall> paywalls;

  const PaywallsListWidget({
    Key? key,
    required this.paywalls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paywalls.isEmpty) {
      return Center(
        child: Text(
          'Nothing to show',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: paywalls.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _PaywallCard(paywall: paywalls[index]);
      },
    );
  }
}

class _PaywallCard extends StatelessWidget {
  final ApphudPaywall paywall;

  const _PaywallCard({required this.paywall});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final experiment = paywall.experimentName;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: (expanded) {
            if (expanded) {
              BlocProvider.of<PurchaseBloc>(context).add(
                PurchaseEvent.paywallShown(paywall),
              );
            }
          },
          title: Text(
            paywall.identifier,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MetaRow(
                  label: 'Products',
                  value: '${paywall.products?.length ?? 0}',
                ),
                if (experiment != null && experiment.isNotEmpty)
                  _MetaRow(label: 'Experiment', value: experiment),
              ],
            ),
          ),
          children: [
            const Divider(height: 1),
            ProductListWidget(products: paywall.products),
          ],
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  final String label;
  final String value;

  const _MetaRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w500,
    );
    final valueStyle = theme.textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: RichText(
        text: TextSpan(
          style: valueStyle,
          children: [
            TextSpan(text: '$label: ', style: labelStyle),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
