import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class SubscriptionsAction extends ActionFlow {
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
    return FutureBuilder<List<ApphudSubscriptionWrapper?>>(
        future: AppHud.subscriptions(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<List<ApphudSubscriptionWrapper?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Expanded(
                child: ListView(
                  children: [
                    ...snapshot.data!
                        .map((subscription) => ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                ListTile(
                                  title: Text("productId"),
                                  subtitle: Text(subscription!.productId!),
                                  tileColor: Colors.green,
                                ),
                                ListTile(
                                  title: Text("expiresDate"),
                                  subtitle:
                                      Text(subscription.expiresDate.toString()),
                                ),
                                ListTile(
                                  title: Text("startedAt"),
                                  subtitle:
                                      Text(subscription.startedAt.toString()),
                                ),
                                ListTile(
                                  title: Text("canceledAt"),
                                  subtitle:
                                      Text(subscription.canceledAt.toString()),
                                ),
                                ListTile(
                                  title: Text("isInRetryBilling"),
                                  subtitle: Text(
                                      subscription.isInRetryBilling.toString()),
                                ),
                                ListTile(
                                  title: Text("isAutorenewEnabled"),
                                  subtitle: Text(subscription.isAutorenewEnabled
                                      .toString()),
                                ),
                                ListTile(
                                  title: Text("isIntroductoryActivated"),
                                  subtitle: Text(subscription
                                      .isIntroductoryActivated
                                      .toString()),
                                )
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
              return Text("Completed without data");
            }
          } else {
            return Text("Waiting");
          }
        });
  }
}
