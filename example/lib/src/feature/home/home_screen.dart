import 'package:apphud_example/src/feature/start/start_bloc.dart';
import 'package:apphud_example/src/feature/start/start_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_list_widget.dart';

class HomeScreenPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen();
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String pathName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StartBloc, StartState>(
        builder: _buildBody,
      ),
    );
  }

  Widget _buildBody(BuildContext context, StartState state) {
    return state.maybeMap(
      orElse: () => Center(child: CircularProgressIndicator()),
      success: _buildProductList,
    );
  }

  Widget _buildProductList(Success value) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductListWidget(productList: value.products),
      ),
    );
  }
}
