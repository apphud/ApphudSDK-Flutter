// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sk_payment_transaction_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKPaymentTransactionWrapper _$SKPaymentTransactionWrapperFromJson(
    Map<String, dynamic> json) {
  return SKPaymentTransactionWrapper(
    transactionIdentifier: json['transactionIdentifier'] as String,
    transactionDate: (json['transactionDate'] as num)?.toDouble(),
    payment: Mapper.skPaymentWrapperFromJson(json['payment']),
  );
}

Map<String, dynamic> _$SKPaymentTransactionWrapperToJson(
        SKPaymentTransactionWrapper instance) =>
    <String, dynamic>{
      'transactionIdentifier': instance.transactionIdentifier,
      'transactionDate': instance.transactionDate,
      'payment': instance.payment,
    };

SKPaymentWrapper _$SKPaymentWrapperFromJson(Map<String, dynamic> json) {
  return SKPaymentWrapper(
    productIdentifier: json['productIdentifier'] as String,
    description: json['description'] as String,
    applicationUsername: json['applicationUsername'] as String,
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$SKPaymentWrapperToJson(SKPaymentWrapper instance) =>
    <String, dynamic>{
      'productIdentifier': instance.productIdentifier,
      'description': instance.description,
      'applicationUsername': instance.applicationUsername,
      'quantity': instance.quantity,
    };
