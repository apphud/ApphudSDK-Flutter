import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_event.freezed.dart';

@freezed
class PurchaseEvent with _$PurchaseEvent {
  const PurchaseEvent._();

  const factory PurchaseEvent.purchase(String id) = Purchase;
}
