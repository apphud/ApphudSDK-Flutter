import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class NonRenewingPurchasesAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: nonRenewingPurchases",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: Without parameters",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  String? productId;
  double? purchasedAt;
  double? canceledAt;

  Widget actionResponse() {
    return FutureBuilder<List<ApphudNonRenewingPurchase?>>(
        //future: AppHud.nonRenewingPurchases(),
        future: Future.error('error'),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<List<ApphudNonRenewingPurchase?>> snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView(
                children: [
                  ...snapshot.data!
                      .map((purchase) => ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ListTile(
                                title: Text("productId"),
                                subtitle: Text(purchase!.productId!),
                                tileColor: Colors.green,
                              ),
                              ListTile(
                                title: Text("expiresDate"),
                                subtitle: Text(purchase.purchasedAt.toString()),
                              ),
                              ListTile(
                                title: Text("startedAt"),
                                subtitle: Text(purchase.canceledAt.toString()),
                              ),
                            ],
                            shrinkWrap: true,
                          ))
                      .toList()
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text("Waiting...");
          }
        });
  }
}
