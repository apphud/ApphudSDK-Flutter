// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudError _$ApphudErrorFromJson(Map json) => ApphudError(
      networkIssue: json['networkIssue'] as bool? ?? false,
      message: json['message'] as String?,
      errorCode: (json['errorCode'] as num?)?.toInt(),
      billingResponseCode: (json['billingResponseCode'] as num?)?.toInt(),
      billingErrorTitle: json['billingErrorTitle'] as String?,
    );

Map<String, dynamic> _$ApphudErrorToJson(ApphudError instance) =>
    <String, dynamic>{
      'networkIssue': instance.networkIssue,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'billingResponseCode': instance.billingResponseCode,
      'billingErrorTitle': instance.billingErrorTitle,
    };
