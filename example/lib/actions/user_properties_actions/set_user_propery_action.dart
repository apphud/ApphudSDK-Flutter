import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class SetUserPropertyAction extends ActionFlow {
  final String nameParameterValue = 'SomeUserName';
  final String emailParameterValue = 'mail@site.com';
  final String phoneParameterValue = '123456789';
  final int ageParameterValue = 20;
  final String genderParameterValue = 'male';
  final String customParameterValue = 'custom value';
  final String customParameterName = 'some_custom_property';

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
          ApphudUserPropertyKey.name,
          nameParameterValue,
        ),
        _buildParameterValueText(
          ApphudUserPropertyKey.email,
          emailParameterValue,
        ),
        _buildParameterValueText(
          ApphudUserPropertyKey.phone,
          phoneParameterValue,
        ),
        _buildParameterValueText(
          ApphudUserPropertyKey.age,
          ageParameterValue,
        ),
        _buildParameterValueText(
          ApphudUserPropertyKey.gender,
          genderParameterValue,
        ),
        _buildParameterValueText(
          ApphudUserPropertyKey.customProperty(customParameterName),
          customParameterValue,
        ),
      ],
    );
  }

  Text _buildParameterValueText(ApphudUserPropertyKey key, dynamic value) {
    return Text(
      "Parameters: $key - $value",
      style: TextStyle(fontSize: 20, color: Colors.green),
    );
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
      key: ApphudUserPropertyKey.name,
      value: nameParameterValue,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.email,
      value: emailParameterValue,
    );

    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.phone,
      value: phoneParameterValue,
    );
    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.age,
      value: ageParameterValue,
    );
    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.gender,
      value: genderParameterValue,
    );
    await AppHud.setUserProperty(
      key: ApphudUserPropertyKey.customProperty(customParameterName),
      value: customParameterValue,
    );
  }
}
