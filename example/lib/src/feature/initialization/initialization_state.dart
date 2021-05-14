import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_state.freezed.dart';

@freezed
class InitializationState with _$InitializationState {
  const InitializationState._();

  const factory InitializationState.trying({
    @Default(false) bool isStartSuccess,
    @Default(false) bool isProductFetched,
    @Default([]) List<ApphudProduct> products,
  }) = Trying;

  const factory InitializationState.success({
    @Default([]) List<ApphudProduct> products,
  }) = Success;

  const factory InitializationState.startFail(String error) = StartFail;

  const factory InitializationState.productsFetchFail(String error) = ProductsFetchFail;
}
