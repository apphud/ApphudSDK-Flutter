import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_event.freezed.dart';

@freezed
class StartEvent with _$StartEvent {
  const StartEvent._();

  const factory StartEvent.tryToStart() = TryToStart;

  const factory StartEvent.productsFetchSuccess(List<ApphudProduct> products) =
      ProductsFetchSuccess;

  const factory StartEvent.productsFetchFailure(String error) =
      ProductsFetchFailure;
}
