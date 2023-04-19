import 'package:apphud_example/src/feature/common/debug_bloc_observer.dart';
import 'package:apphud_example/src/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = DebugBlocObserver();
  runApp(MyApp());
}
