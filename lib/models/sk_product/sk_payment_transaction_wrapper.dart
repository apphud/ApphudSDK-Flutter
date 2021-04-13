import 'package:json_annotation/json_annotation.dart';

import '../mapper.dart';

part 'sk_payment_transaction_wrapper.g.dart';

@JsonSerializable()
class SKPaymentTransactionWrapper {
  String? transactionIdentifier;
  double? transactionDate;
  @JsonKey(fromJson: Mapper.skPaymentWrapperFromJson)
  SKPaymentWrapper? payment;

  SKPaymentTransactionWrapper({
    required this.transactionIdentifier,
    required this.transactionDate,
    required this.payment,
  });

  factory SKPaymentTransactionWrapper.fromJson(Map<String, dynamic> map) =>
      _$SKPaymentTransactionWrapperFromJson(map);
}

@JsonSerializable()
class SKPaymentWrapper {
  String? productIdentifier;
  String? description;
  String? applicationUsername;
  int? quantity;

  SKPaymentWrapper({
    required this.productIdentifier,
    required this.description,
    required this.applicationUsername,
    required this.quantity,
  });

  factory SKPaymentWrapper.fromJson(Map<String, dynamic> map) =>
      _$SKPaymentWrapperFromJson(map);
}
