import 'package:apphud_example/src/feature/navigation/navigation_bloc.dart';
import 'package:apphud_example/src/feature/navigation/navigation_route_information_parser.dart';
import 'package:apphud_example/src/feature/navigation/navigation_router_deligate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  static final NavigationBloc _navigationBloc = NavigationBloc();

  final NavigationRouterDelegate _navigationRouterDelegate =
      NavigationRouterDelegate(_navigationBloc);

  final NavigationRouteInformationParser _navigationRouteInformationParser =
      NavigationRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _navigationBloc,
      child: MaterialApp.router(
        title: 'Apphud Flutter example',
        routeInformationParser: _navigationRouteInformationParser,
        routerDelegate: _navigationRouterDelegate,
      ),
    );
  }
}
