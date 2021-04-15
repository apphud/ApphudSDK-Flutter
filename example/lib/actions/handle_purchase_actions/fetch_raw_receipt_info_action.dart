import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class FetchRawReceiptInfoAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: fetchRawReceiptInfoAction",
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
    return FutureBuilder<dynamic>(
        //future: AppHud.fetchRawReceiptInfo(),
        future: Future.error('error'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final map = Map<String, dynamic>.from(snapshot.data);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Response: ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                ...map.keys.map((key) {
                  return Text(
                    map[key].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                }).toList(),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text("Waiting...");
          }
        });
  }
}
