import 'package:appHud_example/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_delegate/app_delegate_widget.dart';

class MainScreenWidget<T extends BaseRoute> extends StatelessWidget {
  T routes;

  MainScreenWidget(this.routes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: _makeChildren(),
      ),
    );
  }

  List<Widget> _makeChildren() {
    return routes.allRoute
        .map((route) =>
            MainScreenWidgetCellModels(route, routes.isRouteEnabled(route)))
        .map((model) => MainScreenWidgetCell(model))
        .toList();
  }
}

class MainScreenWidgetCell extends StatelessWidget {
  MainScreenWidgetCellModels model;

  MainScreenWidgetCell(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              bottom: 20,
            ),
            child: Text(
              model.name,
              style: TextStyle(
                  color: model.isEnable ? Colors.black : Colors.grey,
                  fontSize: 22),
            ),
          ),
          Container(
            color: Colors.blueGrey,
            height: 1,
          )
        ],
      ),
      onTap: model.isEnable
          ? () {
              navigatorKey.currentState.pushNamed(model.name);
            }
          : null,
    );
  }
}

class MainScreenWidgetCellModels {
  String name;
  bool isEnable;

  MainScreenWidgetCellModels(this.name, this.isEnable);
}
