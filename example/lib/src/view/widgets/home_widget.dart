import 'dart:io';

import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/overlay_progress_indicator.dart';
import 'package:apphud_example/src/view/widgets/paywalls_list_widget.dart';
import 'package:apphud_example/src/view/widgets/placement_list_widget.dart';
import 'package:apphud_example/src/view/widgets/purchase_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatefulWidget {
  static const String pathName = 'home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      builder: (context,state) {
        return state.maybeMap(
          orElse: () => _buildProgressIndicator(),
          success: (s) => _buildProductsTabs(context, s),
        );
      },
    );
  }

  Widget _buildProgressIndicator() =>
      Scaffold(body: Center(child: CircularProgressIndicator()));

  Widget _buildProductsTabs(BuildContext context, PurchaseSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageIndex == 0 ? 'Placements' : 'Paywalls'),
        actions: [_buildMenu()],
      ),
      body: _buildBody(context, state),
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

  Widget _buildBody(BuildContext context, PurchaseSuccessState state) {
    return OverlayProgressIndicator<PurchaseBloc, PurchaseState>(
      child: PurchaseMessageWidget(
        child: _pageIndex == 0
            ? _buildPlacements(context, state)
            : _buildPaywalls(context, state),
      ),
    );
  }

  Widget _buildPaywalls(BuildContext context, PurchaseSuccessState state) {
    return PaywallsListWidget(paywalls: state.paywalls.paywalls);
  }

  Widget _buildPlacements(BuildContext context,PurchaseSuccessState state) {
    return PlacementsListWidget(placements: state.placements);
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
