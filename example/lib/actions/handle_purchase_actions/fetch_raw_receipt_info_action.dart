import 'package:appHud_example/widgets/card_wrapper.dart';
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
    return FutureBuilder<Map<String, dynamic>?>(
      future: AppHud.fetchRawReceiptInfo(),
      builder: (BuildContext context,
          AsyncSnapshot<Map<String, dynamic>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (snapshot.data == null) return Text('No ReceiptInfo fetched');

          final Map<String, dynamic> map = snapshot.data!;

          return Expanded(
              child: ListView(
            children: map.keys
                .map(
                  (String key) => CardWrapper(
                    child: ListTile(
                      title: Text(key),
                      subtitle: Text(map[key].toString()),
                    ),
                  ),
                )
                .toList(),
          ));
        }
        return Text('Waiting...');
      },
    );
  }
}
