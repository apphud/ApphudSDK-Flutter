// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sk_payment_transaction_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKPaymentTransactionWrapper _$SKPaymentTransactionWrapperFromJson(Map json) =>
    SKPaymentTransactionWrapper(
      transactionIdentifier: json['transactionIdentifier'] as String?,
      transactionDate: (json['transactionDate'] as num?)?.toDouble(),
      productIdentifier: json['productIdentifier'] as String,
      state: (json['state'] as num).toInt(),
    );

Map<String, dynamic> _$SKPaymentTransactionWrapperToJson(
        SKPaymentTransactionWrapper instance) =>
    <String, dynamic>{
      'transactionIdentifier': instance.transactionIdentifier,
      'transactionDate': instance.transactionDate,
      'productIdentifier': instance.productIdentifier,
      'state': instance.state,
    };
