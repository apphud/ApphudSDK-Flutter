import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitializationWidget extends StatelessWidget {
  const InitializationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: BlocBuilder<PurchaseBloc, PurchaseState>(
        builder: (context, state) {
          return state.map(
            initialization: _buildInitialization,
            success: _buildSuccess,
            startFailed: (f) => _buildFailed(
              title: 'SDK initialization failed with error:',
              error: f.error,
            ),
          );
        },
      ),
    );
  }

  Widget _buildInitialization(PurchaseInitializationState state) {
    return _buildStatus(
      isStartSuccess: state.isStartSuccess,
      isPaywallsFetched: state.isPaywallsFetched,
      isPlacementsFetched: state.isPlacementsFetched,
    );
  }

  Padding _buildStatus({
    required bool isStartSuccess,
    required bool isPaywallsFetched,
    required bool isPlacementsFetched,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: ListTile(
              leading: isStartSuccess
                  ? Icon(Icons.check)
                  : CircularProgressIndicator(),
              title: Text('SDK initialization'),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: isPaywallsFetched
                  ? Icon(Icons.check)
                  : CircularProgressIndicator(),
              title: Text('Paywalls fetching'),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: isPlacementsFetched
                  ? Icon(Icons.check)
                  : CircularProgressIndicator(),
              title: Text('Placements fetching'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess(PurchaseSuccessState state) {
    return _buildStatus(
      isStartSuccess: true,
      isPaywallsFetched: true,
      isPlacementsFetched: true,
    );
  }

  Widget _buildFailed({required String title, required String error}) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
