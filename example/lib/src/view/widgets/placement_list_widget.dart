import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/product_list_widget.dart';
import 'package:apphud_example/src/view/widgets/overlay_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacementsListWidget extends StatefulWidget {
  final List<ApphudPlacement> placements;

  const PlacementsListWidget({
    Key? key,
    required this.placements,
  }) : super(key: key);

  @override
  _PlacementsListWidgetState createState() => _PlacementsListWidgetState();
}

class _PlacementsListWidgetState extends State<PlacementsListWidget> {
  List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.placements.map((e) => false).toList();
  }

  @override
  void didUpdateWidget(covariant PlacementsListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.placements.length != oldWidget.placements.length) {
      _isExpanded = widget.placements.map((e) => false).toList();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.placements.isEmpty) {
      return Center(child: Text('Nothing to show'));
    }
    return _buildList();
  }

  Widget _buildList() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded[index] = isExpanded;
          });

          final paywall = widget.placements[index].paywall;
          if (paywall != null) {
            final event = isExpanded
                ? PurchaseEvent.paywallShown(paywall)
                : PurchaseEvent.paywallClosed(paywall);
            BlocProvider.of<PurchaseBloc>(context).add(event);
          }
        },
        children: _buildItems(),
      ),
    );
  }

  List<ExpansionPanel> _buildItems() {
    final List<ExpansionPanel> panels = [];
    int index = 0;
    widget.placements.forEach((placement) {
      final ExpansionPanel panel = ExpansionPanel(
        headerBuilder: (_, __) => _buildHeader(placement),
        body: ProductListWidget(products: placement.paywall?.products),
        isExpanded: _isExpanded[index],
      );
      panels.add(panel);
      index++;
    });
    return panels;
  }

  Widget _buildHeader(ApphudPlacement placement) {
    return ListTile(
      key: ValueKey(placement.identifier),
      title: Text(
        '${placement.identifier}',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        'paywall: ${placement.paywall!.identifier}\n'
        'products: ${placement.paywall?.products?.length ?? 0}\n'
        'experimentName: ${placement.experimentName}\n'
        'has screen: ${placement.paywall?.hasScreen ?? false}\n',
      ),
      trailing: (placement.paywall?.hasScreen ?? false)
          ? ElevatedButton(
              onPressed: () => _showPaywall(placement),
              child: Text('Show P'),
            )
          : null,
    );
  }

  void _showPaywall(ApphudPlacement placement) async {
    OverlayProgressIndicatorEntry? loadingIndicator;
    
    try {
      // Show loading indicator
      loadingIndicator = OverlayProgressIndicatorEntry();
      loadingIndicator.insert(context);
      
      final preloadResult = await Apphud.preloadPaywall(placement.identifier, maxTimeout: 10);
      
      // Remove loading indicator
      loadingIndicator.remove();
      loadingIndicator = null;
      
      if (preloadResult['success'] == true) {
        final result = await Apphud.showPaywall(placement.paywall!, maxTimeout: 10, iOSAnimationStyle: IOSAnimationStyle.none);
        print('Paywall show result: $result');
      } else {
        print('Error preloading paywall: ${preloadResult['error']}');
      }
    } catch (e) {
      // Make sure to remove loading indicator in case of error
      if (loadingIndicator != null) {
        loadingIndicator.remove();
      }
      print('Error showing or preloading paywall: $e');
    }
  }
}
