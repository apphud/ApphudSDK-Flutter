import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud_example/src/feature/home/sk_product_widget.dart';
import 'package:apphud_example/src/feature/home/sku_details_widget.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaywallListWidget extends StatefulWidget {
  final ApphudPaywalls paywalls;

  const PaywallListWidget({
    Key? key,
    required this.paywalls,
  }) : super(key: key);

  @override
  _PaywallListWidgetState createState() => _PaywallListWidgetState();
}

class _PaywallListWidgetState extends State<PaywallListWidget> {
  List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.paywalls.paywalls.map((e) => false).toList();
  }

  @override
  void didUpdateWidget(covariant PaywallListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.paywalls.paywalls.length != oldWidget.paywalls.paywalls.length) {
      _isExpanded = widget.paywalls.paywalls.map((e) => false).toList();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.paywalls.paywalls.isEmpty) {
      return Center(child: Text('No paywalls'));
    }
    return _buildList();
  }

  Widget _buildList() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded[index] = !isExpanded;
          });

          final ApphudPaywall paywall = widget.paywalls.paywalls[index];
          PurchaseEvent event;
          event = !isExpanded
              ? PurchaseEvent.paywallShown(paywall)
              : PurchaseEvent.paywallClosed(paywall);
          BlocProvider.of<PurchaseBloc>(context).add(event);
        },
        children: _buildItems(),
      ),
    );
  }

  List<ExpansionPanel> _buildItems() {
    final List<ExpansionPanel> panels = [];
    int index = 0;
    widget.paywalls.paywalls.forEach((paywall) {
      final ExpansionPanel panel = ExpansionPanel(
        headerBuilder: (_, __) => _buildHeader(paywall),
        body: _buildItemBody(paywall),
        isExpanded: _isExpanded[index],
      );
      panels.add(panel);
      index++;
    });
    return panels;
  }

  Widget _buildItemBody(ApphudPaywall paywall) {
    if ((paywall.products?.length ?? 0) == 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('No products to purchase'),
      );
    }
    return _buildProductList(paywall.products!);
  }

  Widget _buildHeader(ApphudPaywall paywall) {
    return ListTile(
      key: ValueKey(paywall.identifier),
      title: Text(
        paywall.identifier,
        style: Theme
            .of(context)
            .textTheme
            .headline5,
      ),
      subtitle: Text(
        'isDefault: ${paywall.isDefault}\n'
            'products: ${paywall.products?.length ?? 0}\n'
            'experimentName: ${paywall.experimentName}\n'
            'variationName: ${paywall.variationName}\n'
            'fromPaywall: ${paywall.fromPaywall}',
      ),
      isThreeLine: true,
      trailing: Platform.isIOS ? _buildABWidget(paywall) : null,
    );
  }

  Widget _buildABWidget(ApphudPaywall paywall) {
    return TextButton(onPressed: () {
      Apphud.didPurchaseFromPaywall(paywall.identifier);
    },
      child: Text('Send\nA/B paywallId'),);
  }

  Widget _buildProductList(List<ApphudProduct> products) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: products.map(_buildProduct).toList(),
      ),
    );
  }

  Widget _buildProduct(ApphudProduct product) {
    Widget content;
    if (Platform.isIOS) {
      content = SkProductWidget(
        skProduct: product.skProduct,
        wrapInCard: false,
        onTap: () =>
            BlocProvider.of<PurchaseBloc>(context).add(
              PurchaseEvent.purchaseProduct(product),
            ),
        onPromote: () =>
            BlocProvider.of<PurchaseBloc>(context).add(
              PurchaseEvent.grantPromotional(product),
            ),
      );
    } else if (Platform.isAndroid) {
      content = SkuDetailsWidget(
        wrapInCard: false,
        skuDetails: product.skuDetails,
        onTap: () =>
            BlocProvider.of<PurchaseBloc>(context).add(
              PurchaseEvent.purchaseProduct(product),
            ),
        onPromote: () =>
            BlocProvider.of<PurchaseBloc>(context).add(
              PurchaseEvent.grantPromotional(product),
            ),
      );
    } else {
      content = Text('No product for this platform');
    }
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              product.name ?? 'No name',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
            content,
          ],
        ),
      ),
    );
  }
}
