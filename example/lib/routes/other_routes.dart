import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class OtherRoutes extends BaseRoute {
  static const enableDebugLogs = "/enableDebugLogs";

  OtherRoutes();

  List<String> get allRoute {
    return [
      enableDebugLogs,
    ];
  }

  bool isRouteEnabled(String route) {
    if (Platform.isIOS) {
      switch (route) {
        default:
          return true;
      }
    } else if (Platform.isAndroid) {
      switch (route) {
        default:
          return true;
      }
    }
    return false;
  }
}
