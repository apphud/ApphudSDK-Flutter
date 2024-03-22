import 'dart:io';

import 'package:apphud_example/app_secrets_ios.dart';
import 'package:apphud_example/src/view/screen/home_screen.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_secrets_android.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSecrets =
        Platform.isAndroid ? AppSecretsAndroid() : AppSecretsIos();
    return MaterialApp(
      home: BlocProvider(
        create: (_) => PurchaseBloc(
          appSecrets: appSecrets,
        )..add(PurchaseEvent.started()),
        child: HomeScreen(),
      ),
    );
  }
}
