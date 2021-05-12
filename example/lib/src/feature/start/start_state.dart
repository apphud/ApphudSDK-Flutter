import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_state.freezed.dart';

@freezed
class StartState with _$StartState {
  const StartState._();

  const factory StartState.trying({
    @Default(false) bool isStartSuccess,
    @Default(false) bool isProductFetched,
    @Default([]) List<ApphudProduct> products,
  }) = Trying;

  const factory StartState.success({
    @Default([]) List<ApphudProduct> products,
  }) = Success;

  const factory StartState.startFail(String error) = StartFail;

  const factory StartState.productsFetchFail(String error) = ProductsFetchFail;
}
