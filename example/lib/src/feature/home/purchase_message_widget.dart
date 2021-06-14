import 'package:apphud_example/src/feature/purchase/purchase_bloc.dart';
import 'package:apphud_example/src/feature/purchase/purchase_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseMessageWidget extends StatelessWidget {
  final Widget child;

  const PurchaseMessageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchaseBloc, PurchaseState>(
      listener: _listener,
      child: child,
    );
  }

  void _listener(BuildContext context, PurchaseState state) {
    final String message = state.maybeMap(
      orElse: () => '',
      purchaseSuccess: (_) => 'The purchase completed successfully',
      purchaseFailure: (f) =>
          'The purchase completed with error: ${f.error.message}'
          '${f.error.errorCode != null ? ', error code:${f.error.errorCode}' : ''}',
      restorePurchasesSuccess: (_) =>
          'The purchases restore completed successfully',
      restorePurchaseFailure: (f) =>
          'The purchases restore completed with error: ${f.error.message}'
          '${f.error.errorCode != null ? ', error code:${f.error.errorCode}' : ''}',
    );

    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
