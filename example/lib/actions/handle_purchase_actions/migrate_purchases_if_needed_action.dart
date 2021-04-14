import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:flutter/cupertino.dart';
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

  Widget actionResponse() {
    return FutureBuilder<ApphudComposite?>(
        future: AppHud.migratePurchasesIfNeeded(),
        builder:
            (BuildContext context, AsyncSnapshot<ApphudComposite?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Waiting...");
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Response: ",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("subscriptions length: ${snapshot.data!.subscriptions!.length}"),
                      Text("purchases length: ${snapshot.data!.purchases!.length}"),
                      Text(snapshot.error.toString()),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Text("Completed without data");
            }
          } else {
            return Text("Something wrong");
          }
        });
  }
}
