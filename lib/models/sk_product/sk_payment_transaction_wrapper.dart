import 'package:json_annotation/json_annotation.dart';

part 'sk_payment_transaction_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class SKPaymentTransactionWrapper {
  final String? transactionIdentifier;
  final double? transactionDate;
  final SKPaymentWrapper? payment;

  SKPaymentTransactionWrapper({
    this.transactionIdentifier,
    this.transactionDate,
    this.payment,
  });

  factory SKPaymentTransactionWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKPaymentTransactionWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKPaymentTransactionWrapperToJson(this);

  @override
  String toString() {
    return 'SKPaymentTransactionWrapper{transactionIdentifier: $transactionIdentifier, transactionDate: $transactionDate, payment: $payment}';
  }
}

@JsonSerializable(anyMap: true)
class SKPaymentWrapper {
  String productIdentifier;
  String description;
  int quantity;
  String? applicationUsername;

  SKPaymentWrapper({
    required this.productIdentifier,
    required this.description,
    required this.quantity,
    this.applicationUsername,
  });

  factory SKPaymentWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKPaymentWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKPaymentWrapperToJson(this);

  @override
  String toString() {
    return 'SKPaymentWrapper{productIdentifier: $productIdentifier, description: $description, quantity: $quantity, applicationUsername: $applicationUsername}';
  }
}
