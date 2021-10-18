// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sk_payment_transaction_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKPaymentTransactionWrapper _$SKPaymentTransactionWrapperFromJson(Map json) =>
    SKPaymentTransactionWrapper(
      transactionIdentifier: json['transactionIdentifier'] as String?,
      transactionDate: (json['transactionDate'] as num?)?.toDouble(),
      payment: json['payment'] == null
          ? null
          : SKPaymentWrapper.fromJson(json['payment'] as Map),
    );

Map<String, dynamic> _$SKPaymentTransactionWrapperToJson(
        SKPaymentTransactionWrapper instance) =>
    <String, dynamic>{
      'transactionIdentifier': instance.transactionIdentifier,
      'transactionDate': instance.transactionDate,
      'payment': instance.payment,
    };

SKPaymentWrapper _$SKPaymentWrapperFromJson(Map json) => SKPaymentWrapper(
      productIdentifier: json['productIdentifier'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      applicationUsername: json['applicationUsername'] as String?,
    );

Map<String, dynamic> _$SKPaymentWrapperToJson(SKPaymentWrapper instance) =>
    <String, dynamic>{
      'productIdentifier': instance.productIdentifier,
      'description': instance.description,
      'quantity': instance.quantity,
      'applicationUsername': instance.applicationUsername,
    };
