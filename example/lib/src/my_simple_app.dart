import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:apphud_example/app_secrets_android.dart';
import 'package:apphud_example/app_secrets_ios.dart';
import 'package:apphud_example/src/view/widgets/sk_product_widget.dart';
import 'package:apphud_example/src/view/widgets/sku_details_widget.dart';
import 'package:flutter/material.dart';

class MySimpleApp extends StatelessWidget {
  const MySimpleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleHomeScreen(),
    );
  }
}

class SimpleHomeScreen extends StatefulWidget {
  const SimpleHomeScreen({Key? key}) : super(key: key);

  @override
  State<SimpleHomeScreen> createState() => _SimpleHomeScreenState();
}

class _SimpleHomeScreenState extends State<SimpleHomeScreen>
    implements ApphudListener {
  final _appSecrets =
      Platform.isAndroid ? AppSecretsAndroid() : AppSecretsIos();
  ApphudPaywalls? _paywalls;
  List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    Apphud.setListener(listener: this);
    Apphud.startManually(
      apiKey: _appSecrets.apiKey,
      userID: _appSecrets.userID,
      deviceID: _appSecrets.deviceID,
      observerMode: _appSecrets.observeMode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_paywalls == null) {
      return Center(child: CircularProgressIndicator());
    }
    return _buildList(_paywalls!);
  }

  Widget _buildList(ApphudPaywalls paywalls) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded[index] = isExpanded;
          });
        },
        children: _buildItems(paywalls),
      ),
    );
  }

  List<ExpansionPanel> _buildItems(ApphudPaywalls paywalls) {
    int index = -1;
    return paywalls.paywalls.map((paywall) {
      index++;
      return ExpansionPanel(
        headerBuilder: (_, __) => _buildHeader(paywall),
        body: _buildItemBody(paywall),
        isExpanded: _isExpanded[index],
      );
    }).toList(growable: false);
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
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'products: ${paywall.products?.length ?? 0}\n'
        'experimentName: ${paywall.experimentName}\n',
      ),
    );
  }

  Widget _buildProductList(List<ApphudProduct> products) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: products.map(_buildProduct).toList(growable: false),
      ),
    );
  }

  Widget _buildProduct(ApphudProduct product) {
    Widget content;
    if (Platform.isIOS) {
      content = SkProductWidget(
        skProduct: product.skProduct,
        wrapInCard: false,
      );
    } else if (Platform.isAndroid) {
      content = ProductDetailsWidget(
        wrapInCard: false,
        productDetails: product.productDetails,
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
              style: Theme.of(context).textTheme.headline6,
            ),
            content,
          ],
        ),
      ),
    );
  }

  @override
  Future<void> apphudDidChangeUserID(String userId) async {}

  @override
  Future<void> apphudDidFecthProducts(
    List<ApphudProductComposite> products,
  ) async {}

  @override
  Future<void> apphudNonRenewingPurchasesUpdated(
    List<ApphudNonRenewingPurchase> purchases,
  ) async {}

  @override
  Future<void> apphudSubscriptionsUpdated(
    List<ApphudSubscriptionWrapper> subscriptions,
  ) async {}

  @override
  Future<void> paywallsDidFullyLoad(ApphudPaywalls paywalls) async {
    setState(() {
      _isExpanded = paywalls.paywalls.map((e) => false).toList(growable: false);
      _paywalls = paywalls;
    });
  }

  @override
  Future<void> placementsDidFullyLoad(List<ApphudPlacement> placements) async {}

  @override
  Future<void> userDidLoad(ApphudUser user) async {}
}
