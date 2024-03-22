import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
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
      listenWhen: _listenWhen,
      child: child,
    );
  }

  void _listener(BuildContext context, PurchaseState state) {
    state.mapOrNull(
      success: (s) {
        final String message = s.userMessage.map(
          purchaseSuccess: (_) => 'The purchase completed successfully',
          purchaseFailure: (f) =>
              'The purchase completed with error: ${f.error.message}'
              '${f.error.errorCode != null ? ', error code:${f.error.errorCode}' : ''}',
          restorePurchasesSuccess: (_) =>
              'The purchases restore completed successfully',
          restorePurchasesFailure: (f) =>
              'The purchases restore completed with error: ${f.error.message}'
              '${f.error.errorCode != null ? ', error code:${f.error.errorCode}' : ''}',
          none: (_) => '',
        );

        if (message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              duration: Duration(seconds: 5),
            ),
          );
        }
      },
    );
  }

  bool _listenWhen(PurchaseState previous, PurchaseState current) =>
      (previous is PurchaseSuccessState && current is! PurchaseSuccessState) ||
      (previous is! PurchaseSuccessState && current is PurchaseSuccessState) ||
      (previous is PurchaseSuccessState &&
          current is PurchaseSuccessState &&
          previous.userMessage != current.userMessage);
}
