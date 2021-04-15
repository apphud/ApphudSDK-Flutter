import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class InitializationRoutes extends BaseRoute {
  static const start = "/initialization/start";
  static const startManually = "/initialization/startManually";
  static const updateUserID = "/initialization/updateUserID";
  static const userID = "/initialization/userID";
  static const deviceID = "/initialization/deviceID";
  static const logout = "/initialization/logout";
  static const setDelegate = "/initialization/setDelegate";
  static const setUIDelegate = "/initialization/setUIDelegate";
  static const enableDebugLogs = "/initialization/enableDebugLogs";

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
      enableDebugLogs,
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

// case start
// case startManually
// case updateUserID
// case userID
// case deviceID
// case logout
// case setDelegate
// case setUIDelegate
