import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:flutter/material.dart';

import 'card_wrapper.dart';

class ApphudSubscriptionWidget extends StatelessWidget {
  final ApphudSubscriptionWrapper? subscription;

  const ApphudSubscriptionWidget({Key? key, this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = subscription == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Not existing subscription'),
            ),
          )
        : _buildSubscription(subscription!);

    return CardWrapper(child: content);
  }

  Widget _buildSubscription(ApphudSubscriptionWrapper subscriptionLocal) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: ListTile(
            title: Text("productId"),
            subtitle: Text(subscriptionLocal.productId),
          ),
        ),
        ListTile(
          title: Text("expiresDate"),
          subtitle: Text(subscriptionLocal.expiresDate.toString()),
        ),
        ListTile(
          title: Text("startedAt"),
          subtitle: Text(subscriptionLocal.startedAt.toString()),
        ),
        ListTile(
          title: Text("canceledAt"),
          subtitle: Text(subscriptionLocal.canceledAt?.toString() ?? 'null'),
        ),
        ListTile(
          title: Text("isInRetryBilling"),
          subtitle: Text(subscriptionLocal.isInRetryBilling.toString()),
        ),
        ListTile(
          title: Text("isAutorenewEnabled"),
          subtitle: Text(subscriptionLocal.isAutorenewEnabled.toString()),
        ),
        ListTile(
          title: Text("isIntroductoryActivated"),
          subtitle: Text(subscriptionLocal.isIntroductoryActivated.toString()),
        )
      ],
    );
  }
}
