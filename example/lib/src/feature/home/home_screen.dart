import 'package:apphud_example/src/feature/common/widgets/overlay_progress_indicator.dart';
import 'package:apphud_example/src/feature/home/purchase_message_widget.dart';
import 'package:apphud_example/src/feature/initialization/initialization_bloc.dart';
import 'package:apphud_example/src/feature/initialization/initialization_state.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_state.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'paywall_list_widget.dart';
import 'product_list_widget.dart';

class HomeScreenPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => PurchaseBloc(),
          lazy: false,
          child: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String pathName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      builder: (BuildContext context, InitializationState state) {
        return state.maybeMap(
          orElse: () => _buildProgressIndicator(),
          success: (s) => _buildProductsTabs(context, s),
        );
      },
    );
  }

  Widget _buildProgressIndicator() =>
      Scaffold(body: Center(child: CircularProgressIndicator()));

  Widget _buildProductsTabs(BuildContext context, Success value) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: _buildRestoreButton(context),
        appBar: _buildAppBar(),
        body: _buildBody(context, value),
      ),
    );
  }

  Widget _buildBody(BuildContext context, Success value) {
    return OverlayProgressIndicator<PurchaseBloc, PurchaseState>(
      child: PurchaseMessageWidget(
        child: TabBarView(
          children: [
            _buildPaywallList(context, value),
            _buildProductList(context, value),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(text: 'Paywalls'),
          Tab(text: 'Products'),
        ],
      ),
      title: Text('Apphud'),
    );
  }

  Widget _buildProductList(BuildContext context, Success value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProductListWidget(productList: value.products),
    );
  }

  Widget _buildPaywallList(BuildContext context, Success value) {
    return PaywallListWidget(paywalls: value.paywalls);
  }

  Widget _buildRestoreButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () => BlocProvider.of<PurchaseBloc>(context).add(
            PurchaseEvent.restorePurchases(),
          ),
          label: Text('Restore purchases'),
        ),
      ),
    );
  }
}
