import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class OtherRoutes extends BaseRoute {
  static const enableDebugLogs = "enableDebugLogs";
  static const isSandbox = "isSandbox";

  OtherRoutes();

  List<String> get allRoute {
    return [
      enableDebugLogs,
      isSandbox,
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
        case OtherRoutes.isSandbox:
          return false;
        default:
          return true;
      }
    }
    return false;
  }
}
