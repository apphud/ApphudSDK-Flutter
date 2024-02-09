import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud_example/src/feature/home/product_list_widget.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
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
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'paywall: ${placement.paywall!.identifier}\n'
        'products: ${placement.paywall?.products?.length ?? 0}\n'
        'experimentName: ${placement.experimentName}\n',
      ),
    );
  }
}
