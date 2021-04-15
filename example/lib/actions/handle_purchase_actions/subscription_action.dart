import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class SubscriptionAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: subscriptions",
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
    return FutureBuilder<ApphudSubscriptionWrapper?>(
        //future: AppHud.subscription(),
        future: Future.error('error'),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<ApphudSubscriptionWrapper?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Waiting...");
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text("productId"),
                    subtitle: Text(snapshot.data!.productId!),
                    tileColor: Colors.green,
                  ),
                  ListTile(
                    title: Text("expiresDate"),
                    subtitle: Text(snapshot.data!.expiresDate.toString()),
                  ),
                  ListTile(
                    title: Text("startedAt"),
                    subtitle: Text(snapshot.data!.startedAt.toString()),
                  ),
                  ListTile(
                    title: Text("canceledAt"),
                    subtitle: Text(snapshot.data!.canceledAt.toString()),
                  ),
                  ListTile(
                    title: Text("isInRetryBilling"),
                    subtitle: Text(snapshot.data!.isInRetryBilling.toString()),
                  ),
                  ListTile(
                    title: Text("isAutorenewEnabled"),
                    subtitle: Text(snapshot.data!.isAutorenewEnabled.toString()),
                  ),
                  ListTile(
                    title: Text("isIntroductoryActivated"),
                    subtitle:
                        Text(snapshot.data!.isIntroductoryActivated.toString()),
                  )
                ],
                shrinkWrap: true,
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
