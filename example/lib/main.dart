import 'package:apphud_example/src/common/debug_bloc_observer.dart';
import 'package:apphud_example/src/my_app.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = DebugBlocObserver();
  Bloc.transformer = sequential();
  runApp(MyApp());
  // Comment above and uncomment below to use simple app based on a StateFullWidget
  //runApp(MySimpleApp());
}
