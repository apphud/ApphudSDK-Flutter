import 'package:appHud_example/routes/routes.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_delegate/app_delegate_widget.dart';

class MainScreenWidget<T extends BaseRoute> extends StatelessWidget {
  final String apiKey = "app_4sY9cLggXpMDDQMmvc5wXUPGReMp8G";
  final String userID = "d7f08a1a-a807-11eb-bcbc-0242ac130002";
  final bool observerMode = true;

  T routes;

  MainScreenWidget(this.routes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder<void>(
      future: _init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return ListView(children: _makeChildren());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<void> _init() async {
    await AppHud.enableDebugLogs();
    await AppHud.start(
      apiKey: apiKey,
      userID: userID,
      observerMode: observerMode,
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
              navigatorKey.currentState!.pushNamed(model.name);
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
