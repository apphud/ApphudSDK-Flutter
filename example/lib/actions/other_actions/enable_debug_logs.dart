import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class EnableDebugLogsAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: enableDebugLogs",
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
        future: AppHud.enableDebugLogs(),
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
