import 'package:apphud/apphud.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class DidFetchProductsNotificationAction extends ActionFlow {
  String parameters = """
     productIdentifier: productMonthly
      """;

  @override
  Widget actionName() {
    return Text(
      "Method name: didFetchProductsNotificationAction",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: ${parameters}",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<String>(
        future: AppHud.didFetchProductsNotification(),
        builder:
            (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Response: ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(snapshot.data),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            return Text("Waiting...");
          }
        });
  }
}
