import 'package:apphud_example/src/feature/home/home_screen.dart';
import 'package:apphud_example/src/feature/navigation/navigation_event.dart';
import 'package:apphud_example/src/feature/initialization/initialization_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_bloc.dart';
import 'navigation_state.dart';

class NavigationRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final NavigationBloc _navigationBloc;

  NavigationRouterDelegate(this._navigationBloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (BuildContext context, NavigationState state) {
      return Navigator(
        key: navigatorKey,
        pages: [
          if (state is Start) InitializationScreenPage(),
          if (state is Home) HomeScreenPage(),
        ],
        onPopPage: (route, result) {
          return !route.didPop(result);
        },
      );
    });
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    configuration.map(
      start: (_) => _navigationBloc.add(NavigationEvent.toStart()),
      home: (_) => _navigationBloc.add(NavigationEvent.toHome()),
    );
  }

  @override
  NavigationState? get currentConfiguration => _navigationBloc.state;
}
