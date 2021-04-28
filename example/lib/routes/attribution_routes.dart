import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class AttributionRoutes extends BaseRoute {
  static const addAttribution = "addAttribution";
  static const disableIDFACollection = "disableIDFACollection";
  static const setAdvertisingIdentifier = "setAdvertisingIdentifier";
  static const disableAdTracking = "disableAdTracking";

  AttributionRoutes();

  List<String> get allRoute {
    return [
      addAttribution,
      disableIDFACollection,
      setAdvertisingIdentifier,
      disableAdTracking,
    ];
  }

  bool isRouteEnabled(String route) {
    if (Platform.isIOS) {
      switch (route) {
        case AttributionRoutes.disableAdTracking:
          return false;
        default:
          return true;
      }
    } else if (Platform.isAndroid) {
      switch (route) {
        case AttributionRoutes.addAttribution:
        case AttributionRoutes.disableAdTracking:
          return true;
        default:
          return false;
      }
    }
    return false;
  }
}
