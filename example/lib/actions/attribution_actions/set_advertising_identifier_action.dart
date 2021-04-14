import 'dart:ui';

import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class SetAdvertisingIdentifierAction extends ActionFlow {
  String parameterName = "idfa";
  String parameterValue = "002ebf12-a125-5ddf-a739-67c3c5d20177";

  @override
  Widget actionName() {
    return Text(
      "Method name: disableIDFA",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: $parameterName - $parameterValue",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
        future: AppHud.setAdvertisingIdentifier(parameterValue),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Completed");
          }
          return Text("Waiting...");
        });
  }
}
