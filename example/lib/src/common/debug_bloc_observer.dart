import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class DebugBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    if (kDebugMode) print('bloc error: $error');
    super.onError(cubit, error, stackTrace);
  }
}
