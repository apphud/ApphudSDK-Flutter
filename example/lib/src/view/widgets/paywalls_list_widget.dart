import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaywallsListWidget extends StatefulWidget {
  final List<ApphudPaywall> paywalls;

  const PaywallsListWidget({
    Key? key,
    required this.paywalls,
  }) : super(key: key);

  @override
  _PaywallsListWidgetState createState() => _PaywallsListWidgetState();
}

class _PaywallsListWidgetState extends State<PaywallsListWidget> {
  List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.paywalls.map((e) => false).toList();
  }

  @override
  void didUpdateWidget(covariant PaywallsListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.paywalls.length != oldWidget.paywalls.length) {
      _isExpanded = widget.paywalls.map((e) => false).toList();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.paywalls.isEmpty) {
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

          final ApphudPaywall paywall = widget.paywalls[index];
          PurchaseEvent event;
          if (isExpanded) {
            event = PurchaseEvent.paywallShown(paywall);
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
    widget.paywalls.forEach((paywall) {
      final ExpansionPanel panel = ExpansionPanel(
        headerBuilder: (_, __) => _buildHeader(paywall),
        body: ProductListWidget(products: paywall.products),
        isExpanded: _isExpanded[index],
      );
      panels.add(panel);
      index++;
    });
    return panels;
  }

  Widget _buildHeader(ApphudPaywall paywall) {
    return ListTile(
      key: ValueKey(paywall.identifier),
      title: Text(
        paywall.identifier,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        'products: ${paywall.products?.length ?? 0}\n'
        'experimentName: ${paywall.experimentName}\n',
      ),
    );
  }
}
