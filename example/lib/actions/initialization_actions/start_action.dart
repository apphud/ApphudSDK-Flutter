import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class StartAction extends ActionFlow {
  String apiKey = "app_DZzKAkuBWhe9nz3qeofJMU9PJezkxn";
  String userID = "flutter_test_april_19";
  bool observerMode = true;

  Widget actionName() {
    return Text(
      "Method name: start",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return ListView(
      children: [
        ListTile(
          title: Text("apiKey"),
          subtitle: Text(apiKey),
        ),
        ListTile(
          title: Text("userID"),
          subtitle: Text(userID),
        )
      ],
      shrinkWrap: true,
    );
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
        future: AppHud.start(
          apiKey: apiKey,
          userID: userID,
          observerMode: observerMode,
        ),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return Text("done");
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return Text("Waiting...");
          }
        });
  }
}
