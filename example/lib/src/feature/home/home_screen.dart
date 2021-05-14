import 'package:apphud_example/src/feature/initialization/initialization_bloc.dart';
import 'package:apphud_example/src/feature/initialization/initialization_state.dart';
import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Product list')),
      body: SafeArea(
        child: BlocBuilder<InitializationBloc, InitializationState>(
          builder: _buildBody,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, InitializationState state) {
    return state.maybeMap(
      orElse: () => Center(child: CircularProgressIndicator()),
      success: _buildProductList,
    );
  }

  Widget _buildProductList(Success value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProductListWidget(productList: value.products),
    );
  }
}
