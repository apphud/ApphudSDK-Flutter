import 'package:apphud_example/src/feature/initialization/initialization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'initialization_state.dart';

class InitializationScreenPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return InitializationStartScreen();
      },
    );
  }
}

class InitializationStartScreen extends StatelessWidget {
  static const String pathName = 'start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: BlocBuilder<InitializationBloc, InitializationState>(
        builder: (BuildContext context, InitializationState state) {
          return state.map(
            trying: _buildTrying,
            success: _buildSuccess,
            startFail: (f) => _buildFail(
              title: 'SDK initialization failed with error:',
              error: f.error,
            ),
            productsFetchFail: (f) => _buildFail(
              title: 'Products fetching failed with error:',
              error: f.error,
            ),
            paywallsFetchFail: (f) => _buildFail(
              title: 'Paywalls fetching failed with error:',
              error: f.error,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrying(Trying value) {
    return _buildStatus(
      isStartSuccess: value.isStartSuccess,
      isProductFetched: value.isProductFetched,
      isPaywallsFetched: value.isPaywallsFetched,
    );
  }

  Padding _buildStatus({
    required bool isStartSuccess,
    required bool isProductFetched,
    required bool isPaywallsFetched,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: ListTile(
              leading: isStartSuccess
                  ? CircularProgressIndicator()
                  : Icon(Icons.check),
              title: Text('SDK initialization'),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: isProductFetched
                  ? CircularProgressIndicator()
                  : Icon(Icons.check),
              title: Text('Products fetching'),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: isPaywallsFetched
                  ? CircularProgressIndicator()
                  : Icon(Icons.check),
              title: Text('Paywalls fetching'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess(Success value) {
    return _buildStatus(
      isStartSuccess: true,
      isProductFetched: true,
      isPaywallsFetched: true,
    );
  }

  Widget _buildFail({required String title, required String error}) {
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
