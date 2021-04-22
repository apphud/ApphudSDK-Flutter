import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class PresentOfferCodeRedemptionSheetAction extends ActionFlow {
  Widget actionName() {
    return Text(
      "Method name: presentOfferCodeRedemptionSheet",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text(
      "Parameters: Without parameters",
      style: TextStyle(fontSize: 20, color: Colors.green),
    );
  }

  Widget actionResponse() {
    return FutureBuilder<void>(
        future: AppHud.presentOfferCodeRedemptionSheet(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return Text("done");
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return Text("Waiting...");
          }
        });
  }
}
