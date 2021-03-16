import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionScreen<T extends ActionFlow> extends StatefulWidget {
  T action;

  ActionScreen(this.action);

  @override
  State<StatefulWidget> createState() {
    return ActionScreenState();
  }
}

class ActionScreenState extends State<ActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.action.actionName(),
          widget.action.actionParameters(),
          widget.action.actionResponse()
        ],
      ),
    );
  }
}

abstract class ActionFlow {
  Widget actionName();

  Widget actionParameters();

  Widget actionResponse();
}
