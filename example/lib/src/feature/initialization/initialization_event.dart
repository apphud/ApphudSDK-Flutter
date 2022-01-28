import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_event.freezed.dart';

@freezed
class InitializationEvent with _$InitializationEvent {
  const InitializationEvent._();

  const factory InitializationEvent.initializeTrying() = InitializeTrying;

  const factory InitializationEvent.paywallsFetchSuccess(
      ApphudPaywalls paywalls) = PaywallsFetchSuccess;
}
