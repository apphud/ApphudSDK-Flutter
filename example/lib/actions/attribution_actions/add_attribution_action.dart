import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class AddAttributionAction extends ActionFlow {
  String parameterName = "data";
  Map<String, dynamic> parameterValue = {"test": "testValue"};
  String parameterName2 = "provider";
  ApphudAttributionProvider parameterValue2 =
      ApphudAttributionProvider.appsFlyer;
  String parameterName3 = "identifer";
  String parameterValue3 = "productMonthly2";

  @override
  Widget actionName() {
    return Text(
      "Method name: AddAttribution",
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
    return FutureBuilder<bool>(
      future: AppHud.addAttribution(
          data: parameterValue,
          provider: parameterValue2,
          identifier: parameterValue3),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Response: ", style: TextStyle(fontSize: 20)),
              Text(snapshot.data.toString()),
            ],
          );
        }
        return Text("Waiting...");
      },
    );
  }
}
