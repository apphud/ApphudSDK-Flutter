import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class InitializationRoutes extends BaseRoute {
  static const start = "start";
  static const startManually = "startManually";
  static const updateUserID = "updateUserID";
  static const userID = "userID";
  static const deviceID = "deviceID";
  static const logout = "logout";
  static const setDelegate = "setDelegate";
  static const setUIDelegate = "setUIDelegate";

  InitializationRoutes();

  List<String> get allRoute {
    return [
      start,
      startManually,
      updateUserID,
      userID,
      deviceID,
      logout,
      setDelegate,
      setUIDelegate,
    ];
  }

  bool isRouteEnabled(String route) {
    if (Platform.isIOS) {
      switch (route) {
        case InitializationRoutes.setDelegate:
        case InitializationRoutes.setUIDelegate:
          return false;
        default:
          return true;
      }
    } else if (Platform.isAndroid) {
      switch (route) {
        case InitializationRoutes.setDelegate:
        case InitializationRoutes.setUIDelegate:
          return false;
        default:
          return true;
      }
    }
    return false;
  }
}
