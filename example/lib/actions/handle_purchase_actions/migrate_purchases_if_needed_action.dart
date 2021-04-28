import 'package:appHud_example/widgets/apphud_composite_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class MigratePurchasesIfNeededAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: migratePurchasesIfNeeded",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: Without parameters",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() => ApphudCompositeWidget(
        future: AppHud.migratePurchasesIfNeeded(),
      );
}
