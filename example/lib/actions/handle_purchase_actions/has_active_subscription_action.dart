import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class HasActiveSubscriptionAction extends ActionFlow {

  @override
  Widget actionName() {
    return Text(
      "Method name: hasActiveSubscription",
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
    return FutureBuilder<bool?>(
       // future: AppHud.hasActiveSubscription(),
        future: Future.error('error'),
        builder:
            (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Response: ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(snapshot.data.toString()),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error as String);
          } else {
            return Text("Waiting...");
          }
        });
  }
}
