import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_event.freezed.dart';

@freezed
class InitializationEvent with _$InitializationEvent {
  const InitializationEvent._();

  const factory InitializationEvent.initializeTrying() = InitializeTrying;

  const factory InitializationEvent.productsFetchSuccess(
      List<ApphudProductComposite> products) = ProductsFetchSuccess;

  const factory InitializationEvent.paywallsFetchSuccess(
      ApphudPaywalls paywalls) = PaywallsFetchSuccess;

  const factory InitializationEvent.productsFetchFailure(String error) =
      ProductsFetchFailure;

  const factory InitializationEvent.paywallsFetchFailure(String error) =
      PaywallsFetchFailure;
}
