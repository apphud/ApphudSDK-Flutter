import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class SetUserPropertyAction extends ActionFlow {
  final String parameterValue = 'SomeUserName';

  @override
  Widget actionName() {
    return Text(
      "Method name: setUserProperty",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: ${ApphudUserPropertyKey.name} - $parameterValue",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
      future: AppHud.setUserProperty(
          key: ApphudUserPropertyKey.name, value: parameterValue),
      builder: (
        BuildContext context,
        AsyncSnapshot<void> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          return Text("done", style: TextStyle(fontSize: 20));
        }
        return Text("Waiting...");
      },
    );
  }
}
