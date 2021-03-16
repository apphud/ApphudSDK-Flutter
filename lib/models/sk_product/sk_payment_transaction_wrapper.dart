import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mapper.dart';

part 'sk_payment_transaction_wrapper.g.dart';

@JsonSerializable(nullable: true)
class SKPaymentTransactionWrapper {
  String transactionIdentifier;
  double transactionDate;
  @JsonKey(fromJson: Mapper.skPaymentWrapperFromJson)
  SKPaymentWrapper payment;

  SKPaymentTransactionWrapper({
    @required this.transactionIdentifier,
    @required this.transactionDate,
    @required this.payment,
  });

  factory SKPaymentTransactionWrapper.fromJson(Map map) {
    assert(map != null, 'Map must not be null.');
    return _$SKPaymentTransactionWrapperFromJson(map);
  }

}

@JsonSerializable(nullable: true)
class SKPaymentWrapper {
  String productIdentifier;
  String description;
  String applicationUsername;
  int quantity;

  SKPaymentWrapper({
    @required this.productIdentifier,
    @required this.description,
    @required this.applicationUsername,
    @required this.quantity,
  });

  factory SKPaymentWrapper.fromJson(Map map) {
    assert(map != null, 'Map must not be null.');
    return _$SKPaymentWrapperFromJson(map);
  }
}