import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.freezed.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const NavigationEvent._();

  const factory NavigationEvent.toStart() = ToStart;

  const factory NavigationEvent.toHome() = ToHome;
}
