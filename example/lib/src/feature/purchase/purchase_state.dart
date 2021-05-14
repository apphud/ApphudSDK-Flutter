import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_state.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState {
  const PurchaseState._();

  const factory PurchaseState.init() = Init;
}
