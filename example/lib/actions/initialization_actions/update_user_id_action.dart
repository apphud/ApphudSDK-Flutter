import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class UpdateUserIdAction extends ActionFlow {

  String userID = "test_ren6_10_2";
  String userID2 = "test_ren6_10_10000";
  String userID3 = "¯\_(ツ)_/¯";

  Widget actionName() {
    return Text(
      "Method name: updateUserId",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return ListView(
      children: [
        ListTile(
          title: Text("userID"),
          subtitle: Text(userID),
        ),
      ],
      shrinkWrap: true,);
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
        future: AppHud.updateUserID(userID),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return Text("done");
          } else if (snapshot.hasError) {
            return Text(snapshot.error as String);
          } else {
            return Text("Waiting...");
          }
        });
  }
}
