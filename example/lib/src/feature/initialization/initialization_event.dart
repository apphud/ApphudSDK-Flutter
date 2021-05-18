import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_event.freezed.dart';

@freezed
class InitializationEvent with _$InitializationEvent {
  const InitializationEvent._();

  const factory InitializationEvent.initializeTrying() = InitializeTrying;

  const factory InitializationEvent.productsFetchSuccess(List<ApphudProduct> products) =
      ProductsFetchSuccess;

  const factory InitializationEvent.productsFetchFailure(String error) =
      ProductsFetchFailure;
}
