import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/material.dart';

class ApphudErrorWidget extends StatelessWidget {
  final ApphudError? error;

  const ApphudErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = error == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ApphudError not present'),
            ),
          )
        : _buildResult(error!);

    return CardWrapper(child: content);
  }

  Widget _buildResult(ApphudError error) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: ListTile(
            title: Text("errorMessage"),
            subtitle: Text(error.message ?? 'null'),
          ),
        ),
        ListTile(
          title: Text("errorCode"),
          subtitle: Text(error.errorCode?.toString() ?? 'null'),
        ),
      ],
    );
  }
}
