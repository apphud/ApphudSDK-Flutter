import 'package:json_annotation/json_annotation.dart';

part 'sk_payment_transaction_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class SKPaymentTransactionWrapper {
  final String? transactionIdentifier;
  final double? transactionDate;
  final String productIdentifier;
  final int state;

  SKPaymentTransactionWrapper({
    this.transactionIdentifier,
    this.transactionDate,
    required this.productIdentifier,
    required this.state,
  });

  factory SKPaymentTransactionWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKPaymentTransactionWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKPaymentTransactionWrapperToJson(this);

  @override
  String toString() {
    return 'SKPaymentTransactionWrapper{transactionIdentifier: $transactionIdentifier, transactionDate: $transactionDate, payment: $payment}';
  }
}
