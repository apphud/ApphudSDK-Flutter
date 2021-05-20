import 'package:apphud_example/src/feature/home/home_screen.dart';
import 'package:apphud_example/src/feature/navigation/navigation_state.dart';
import 'package:apphud_example/src/feature/initialization/initialization_screen.dart';
import 'package:flutter/material.dart';

class NavigationRouteInformationParser
    extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return NavigationState.start();
    }
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) return NavigationState.start();

    switch (uri.pathSegments[0]) {
      case InitializationStartScreen.pathName:
        return NavigationState.start();
    }
    return NavigationState.start();
  }

  @override
  RouteInformation restoreRouteInformation(NavigationState state) {
    return state.map(
      start: (_) => RouteInformation(location: '/${InitializationStartScreen.pathName}'),
      home: (_) => RouteInformation(location: '/${HomeScreen.pathName}'),
    );
  }
}
