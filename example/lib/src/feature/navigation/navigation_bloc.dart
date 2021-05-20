import 'dart:async';

import 'package:bloc/bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.start());

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) =>
      event.map(
        toStart: _mapToStart,
        toHome: _mapToHome,
      );

  Stream<NavigationState> _mapToHome(ToHome value) async* {
    yield NavigationState.home();
  }

  Stream<NavigationState> _mapToStart(ToStart value) async* {
    yield NavigationState.start();
  }
}
