import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class AttributionRoutes extends BaseRoute {
  static const addAttribution = "addAttribution";
  static const disableIDFACollection = "disableIDFACollection";
  static const setAdvertisingIdentifier = "setAdvertisingIdentifier";

  AttributionRoutes();

  List<String> get allRoute {
    return [
      addAttribution,
      disableIDFACollection,
      setAdvertisingIdentifier,
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
        case AttributionRoutes.addAttribution:
          return true;
        default:
          return false;
      }
    }
  }
}
