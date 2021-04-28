import 'package:appHud_example/widgets/apphud_subscription_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class SubscriptionAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: subscription",
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
      future: AppHud.subscription(),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApphudSubscriptionWrapper?> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          return Expanded(
            child: SingleChildScrollView(
                child: ApphudSubscriptionWidget(subscription: snapshot.data)),
          );
        }
        return Text('Waiting...');
      },
    );
  }
}
