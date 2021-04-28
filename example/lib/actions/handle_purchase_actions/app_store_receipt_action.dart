import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class AppStoreReceiptAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: appStoreReceipt",
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
      future: AppHud.appStoreReceipt(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          return Expanded(
            child: SingleChildScrollView(
              child: CardWrapper(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(snapshot.data ?? 'null'),
                ),
              ),
            ),
          );
        }
        return Text("Waiting...");
      },
    );
  }
}
