import 'dart:io';

import 'package:apphud_example/src/feature/common/widgets/overlay_progress_indicator.dart';
import 'package:apphud_example/src/feature/home/paywalls_list_widget.dart';
import 'package:apphud_example/src/feature/home/placement_list_widget.dart';
import 'package:apphud_example/src/feature/home/purchase_message_widget.dart';
import 'package:apphud_example/src/feature/initialization/initialization_bloc.dart';
import 'package:apphud_example/src/feature/initialization/initialization_state.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_state.dart';
import 'package:apphud_example/src/feature/purchase/purchase_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class HomeScreen extends StatefulWidget {
  static const String pathName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

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
      appBar: AppBar(
        title: Text(_pageIndex == 0 ? 'Placements' : 'Paywalls'),
        actions: [_buildMenu()],
      ),
      body: _buildBody(context, value),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Text(
              'Placements',
              style: _pageIndex == 0
                  ? TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Paywalls',
              style: _pageIndex == 1
                  ? TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )
                  : null,
            ),
            label: '',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: _handleBottomBarTap,
        selectedItemColor: Colors.blue,
      ),
    );
  }

  Widget _buildMenu() {
    return PopupMenuButton(
      itemBuilder: _buildMenuItems,
    );
  }

  Widget _buildBody(BuildContext context, Success value) {
    return OverlayProgressIndicator<PurchaseBloc, PurchaseState>(
      child: PurchaseMessageWidget(
        child: _pageIndex == 0
            ? _buildPlacements(context, value)
            : _buildPaywalls(context, value),
      ),
    );
  }

  Widget _buildPaywalls(BuildContext context, Success value) {
    return PaywallsListWidget(paywalls: value.paywalls.paywalls);
  }

  Widget _buildPlacements(BuildContext context, Success value) {
    return PlacementsListWidget(placements: value.placements);
  }

  List<PopupMenuEntry> _buildMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Call all'),
        onTap: () => BlocProvider.of<PurchaseBloc>(context).add(
          PurchaseEvent.callAll(),
        ),
      ),
      if (Platform.isAndroid)
        PopupMenuItem(
          child: Text('Sync purchases'),
          onTap: () => BlocProvider.of<PurchaseBloc>(context).add(
            PurchaseEvent.syncPurchase(),
          ),
        ),
      PopupMenuItem(
        child: Text('Restore purchases'),
        onTap: () => BlocProvider.of<PurchaseBloc>(context).add(
          PurchaseEvent.restorePurchases(),
        ),
      ),
    ];
  }

  void _handleBottomBarTap(int value) {
    _pageIndex = value;
    if (mounted) setState(() {});
  }
}
