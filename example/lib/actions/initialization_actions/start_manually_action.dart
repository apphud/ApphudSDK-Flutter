import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class StartManuallyAction extends ActionFlow {
  String apiKey = "app_4sY9cLggXpMDDQMmvc5wXUPGReMp8G";
  String userID = "d7f08a1a-a807-11eb-bcbc-0242ac130002";
  String deviceID = "a356ca94-e3e2-4a1f-8096-b75af8ab7411";
  bool observerMode = true;

  Widget actionName() {
    return Text(
      "Method name: startManually",
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
        ),
        ListTile(
          title: Text("deviceID"),
          subtitle: Text(deviceID),
        )
      ],
      shrinkWrap: true,);
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
        future: AppHud.startManually(
          apiKey: apiKey,
          userID: userID,
          deviceID: deviceID,
          observerMode: true,
        ),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return Text("done");
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text("Waiting...");
          }
        });
  }
}
