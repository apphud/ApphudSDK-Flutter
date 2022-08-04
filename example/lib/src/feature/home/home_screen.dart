import 'dart:io';

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
    return Scaffold(
      bottomNavigationBar: _buildRestoreButton(context),
      appBar: AppBar(title: Text('Paywalls')),
      body: _buildBody(context, value),
    );
  }

  Widget _buildBody(BuildContext context, Success value) {
    return OverlayProgressIndicator<PurchaseBloc, PurchaseState>(
      child: PurchaseMessageWidget(
        child: _buildPaywallList(context, value),
      ),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              onPressed: () => BlocProvider.of<PurchaseBloc>(context).add(
                PurchaseEvent.restorePurchases(),
              ),
              label: Text('Restore purchases'),
            ),
            if (Platform.isAndroid) const SizedBox(height: 10),
            if (Platform.isAndroid)
              FloatingActionButton.extended(
                onPressed: () => BlocProvider.of<PurchaseBloc>(context).add(
                  PurchaseEvent.refreshEntitlements(),
                ),
                label: Text('Refresh entitlements'),
              ),
          ],
        ),
      ),
    );
  }
}
