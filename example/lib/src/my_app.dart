import 'dart:io';

import 'package:apphud_example/app_secrets_ios.dart';
import 'package:apphud_example/src/feature/initialization/initialization_bloc.dart';
import 'package:apphud_example/src/feature/initialization/initialization_event.dart';
import 'package:apphud_example/src/feature/navigation/navigation_bloc.dart';
import 'package:apphud_example/src/feature/navigation/navigation_route_information_parser.dart';
import 'package:apphud_example/src/feature/navigation/navigation_router_deligate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_secrets_android.dart';

class MyApp extends StatelessWidget {
  static final NavigationBloc _navigationBloc = NavigationBloc();

  final NavigationRouterDelegate _navigationRouterDelegate =
      NavigationRouterDelegate(_navigationBloc);

  final NavigationRouteInformationParser _navigationRouteInformationParser =
      NavigationRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _navigationBloc),
        BlocProvider(
            create: (_) => InitializationBloc(
                  appSecrets: Platform.isAndroid
                      ? AppSecretsAndroid()
                      : AppSecretsIos(),
                  navigationBloc: _navigationBloc,
                )..add(InitializationEvent.initializeTrying()),
            lazy: false),
      ],
      child: MaterialApp.router(
        title: 'Apphud Flutter example',
        routeInformationParser: _navigationRouteInformationParser,
        routerDelegate: _navigationRouterDelegate,
      ),
    );
  }
}
