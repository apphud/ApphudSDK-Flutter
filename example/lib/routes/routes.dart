import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

abstract class BaseRoute {
  List<String> get allRoute;

  bool isRouteEnabled(String route);
}

class Routes extends BaseRoute {
  static const home = '/';
  static const initialization = '/initialization';
  static const makePurchase = '/makePurchase';
  static const handlePurchases = '/handlePurchases';
  static const userProperties = '/userProperties';
  static const rulesAndScreensMethods = '/rulesAndScreensMethods';
  static const pushNotifications = '/pushNotifications';
  static const attribution = '/attribution';
  static const eligibilityChecks = '/eligibilityChecks';
  static const others = '/others';

  Routes();

  List<String> get allRoute {
    return [
      initialization,
      makePurchase,
      handlePurchases,
      userProperties,
      rulesAndScreensMethods,
      pushNotifications,
      attribution,
      eligibilityChecks,
      others,
    ];
  }

  bool isRouteEnabled(String route) {
    switch (route) {
      case Routes.initialization:
      case Routes.makePurchase:
      case Routes.handlePurchases:
      case Routes.attribution:
        return true;
      default:
        return false;
    }
  }
}
