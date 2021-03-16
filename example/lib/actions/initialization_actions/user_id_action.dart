import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class UserIdAction extends ActionFlow {
  String response;

  @override
  Widget actionName() {
    return Text(
      "Method name: userId",
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
    return FutureBuilder<String>(
        future: AppHud.userID(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            return Text("Waiting...");
          }
        });
  }
}