import 'package:apphud/apphud.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class RefreshStoreKitProductsAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: refreshStoreKitProducts",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: Without parameters",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<List<SKProductWrapper?>>(
        //future: AppHud.refreshStoreKitProducts(),
        future: Future.error('error'),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<List<SKProductWrapper?>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Response: ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                ...snapshot.data!
                    .map((product) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product!.productIdentifier!),
                   // Text(product.price!),
                    Text(product.localizedTitle!),
                  ],
                ))
                    .toList()
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text("Waiting...");
          }
        });
  }
}