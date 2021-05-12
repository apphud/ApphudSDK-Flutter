import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const NavigationState._();

  const factory NavigationState.start() = Start;

  const factory NavigationState.home() = Home;
}
