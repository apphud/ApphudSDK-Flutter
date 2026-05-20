import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/product_list_widget.dart';
import 'package:apphud_example/src/view/widgets/overlay_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacementsListWidget extends StatelessWidget {
  final List<ApphudPlacement> placements;

  const PlacementsListWidget({
    Key? key,
    required this.placements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (placements.isEmpty) {
      return Center(
        child: Text(
          'Nothing to show',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: placements.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _PlacementCard(placement: placements[index]);
      },
    );
  }
}

class _PlacementCard extends StatelessWidget {
  final ApphudPlacement placement;

  const _PlacementCard({required this.placement});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final paywall = placement.paywall;
    final hasScreen = paywall?.hasScreen ?? false;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: (expanded) {
            if (expanded && paywall != null) {
              BlocProvider.of<PurchaseBloc>(context).add(
                PurchaseEvent.paywallShown(paywall),
              );
            }
          },
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  placement.identifier,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (hasScreen) ...[
                const SizedBox(width: 8),
                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  onPressed: () => _showPaywall(context, placement),
                  child: const Text('Show paywall'),
                ),
              ],
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: _PlacementMetadata(placement: placement),
          ),
          children: [
            const Divider(height: 1),
            ProductListWidget(products: paywall?.products),
          ],
        ),
      ),
    );
  }

  Future<void> _showPaywall(
    BuildContext context,
    ApphudPlacement placement,
  ) async {
    OverlayProgressIndicatorEntry? loadingIndicator;

    try {
      loadingIndicator = OverlayProgressIndicatorEntry();
      loadingIndicator.insert(context);

      final preloadResult = await Apphud.preloadPaywall(
        placement.identifier,
        maxTimeout: 10,
      );

      loadingIndicator.remove();
      loadingIndicator = null;

      if (preloadResult['success'] == true) {
        final result = await Apphud.showPaywall(
          placement.paywall!,
          maxTimeout: 10,
          iOSAnimationStyle: IOSAnimationStyle.bottomToTop,
        );

        if (result.success) {
          print('✅ Purchase completed successfully!');
          if (result.subscription != null) {
            print('📱 Subscription: ${result.subscription!.productId}');
          }
          if (result.nonRenewingPurchase != null) {
            print(
              '🛒 Non-renewing purchase: ${result.nonRenewingPurchase!.productId}',
            );
          }
        } else if (result.userClosed) {
          print('❌ User closed the paywall');
        } else if (result.error != null) {
          print('⚠️ Error: ${result.error!.message}');
        }
      } else {
        print('Error preloading paywall: ${preloadResult['error']}');
      }
    } catch (e) {
      loadingIndicator?.remove();
      print('Error showing or preloading paywall: $e');
    }
  }
}

class _PlacementMetadata extends StatelessWidget {
  final ApphudPlacement placement;

  const _PlacementMetadata({required this.placement});

  @override
  Widget build(BuildContext context) {
    final paywall = placement.paywall;
    final experiment = placement.experimentName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MetaRow(label: 'Paywall', value: paywall?.identifier ?? '—'),
        _MetaRow(
          label: 'Products',
          value: '${paywall?.products?.length ?? 0}',
        ),
        if (experiment != null && experiment.isNotEmpty)
          _MetaRow(label: 'Experiment', value: experiment),
        _MetaRow(
          label: 'Has screen',
          value: '${paywall?.hasScreen ?? false}',
        ),
      ],
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
