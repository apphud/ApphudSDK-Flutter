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
      isPaywallsFetched: value.isPaywallsFetched,
    );
  }

  Padding _buildStatus({
    required bool isStartSuccess,
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
        ],
      ),
    );
  }

  Widget _buildSuccess(Success value) {
    return _buildStatus(
      isStartSuccess: true,
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
