import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class UserPropertiesRoutes extends BaseRoute {
  static const setUserProperty = "setUserProperty";

  UserPropertiesRoutes();

  List<String> get allRoute {
    return [
      setUserProperty,
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
