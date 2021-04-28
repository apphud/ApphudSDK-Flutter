import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class DeviceIdAction extends ActionFlow {

  @override
  Widget actionName() {
    return Text(
      "Method name: deviceId",
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
    return FutureBuilder<String?>(
        future: AppHud.deviceID(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error as String);
          } else {
            return Text("Waiting...");
          }
        });
  }
}
