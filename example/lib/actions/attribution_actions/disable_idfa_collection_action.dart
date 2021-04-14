import 'dart:ui';

import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class DisableIDFACollectionAction extends ActionFlow {
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
    return Text("Parameters: Without parameters",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
        future: AppHud.disableIDFACollection(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Completed");
          }
          return Text("Waiting...");
        });
  }
}
