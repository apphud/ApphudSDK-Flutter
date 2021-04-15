import 'package:appHud_example/widgets/apphud_product_list_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../action_screen.dart';

class ProductsAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: products",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget actionParameters() {
    return Text(
      "Parameters: Without parameters",
      style: TextStyle(fontSize: 20, color: Colors.green),
    );
  }

  Widget actionResponse() => ApphudProductListWidget(future: AppHud.products());
}
