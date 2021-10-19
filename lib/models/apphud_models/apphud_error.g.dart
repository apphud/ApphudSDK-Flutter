// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudError _$ApphudErrorFromJson(Map json) => ApphudError(
      message: json['message'] as String?,
      errorCode: json['errorCode'] as int?,
    );

Map<String, dynamic> _$ApphudErrorToJson(ApphudError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorCode': instance.errorCode,
    };
