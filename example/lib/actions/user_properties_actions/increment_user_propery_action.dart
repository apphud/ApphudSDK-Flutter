import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class IncrementUserPropertyAction extends ActionFlow {
  final int ageParameterValue = 20;
  final int incrementAgeParameterValue = 1;

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildParameterValueText(
          'Set user property: ${ApphudUserPropertyKey.age} '
          'to $ageParameterValue',
        ),
        _buildParameterValueText(
          'Increase user property: ${ApphudUserPropertyKey.age} '
          'by $incrementAgeParameterValue',
        ),
      ],
    );
  }

  Text _buildParameterValueText(String text) {
    return Text(text, style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
      future: _setUserProperties(),
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

  Future<void> _setUserProperties() async {
    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.age,
      value: ageParameterValue,
    );
    await AppHud.incrementUserProperty(
      key: ApphudUserPropertyKey.age,
      by: incrementAgeParameterValue,
    );
  }
}
