import 'package:appHud_example/widgets/apphud_subscription_widget.dart';
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
    return FutureBuilder<List<ApphudSubscriptionWrapper>>(
      future: AppHud.subscriptions(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ApphudSubscriptionWrapper>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (snapshot.data?.isEmpty ?? true)
            return Center(child: Text('No subscriptions'));
          final List<ApphudSubscriptionWrapper> subscriptions = snapshot.data!;
          return Expanded(
            child: ListView(
              children: subscriptions
                  .map((s) => ApphudSubscriptionWidget(subscription: s))
                  .toList(),
            ),
          );
        }
        return Text('Waiting...');
      },
    );
  }
}
