import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:apphud_example/src/view/widgets/home_widget.dart';
import 'package:apphud_example/src/view/widgets/initialization_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      buildWhen: _buildWhen,
      builder: _build,
    );
  }

  Widget _build(BuildContext context, PurchaseState state) {
    return state.maybeMap(
      orElse: () => InitializationWidget(),
      success: (_) => HomeWidget(),
    );
  }

  bool _buildWhen(PurchaseState previous, PurchaseState current) =>
      previous.runtimeType != current.runtimeType;
}
