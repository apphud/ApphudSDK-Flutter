import 'package:json_annotation/json_annotation.dart';

part 'apphud_error.g.dart';

@JsonSerializable(anyMap: true)
class ApphudError {
  final bool networkIssue;
  final String? message;
  final int? errorCode;
  final int? billingResponseCode;
  final String? billingErrorTitle;

  ApphudError({
    this.networkIssue = false,
    this.message,
    this.errorCode,
    this.billingResponseCode,
    this.billingErrorTitle,
  });

  factory ApphudError.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudErrorFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudErrorToJson(this);

  @override
  String toString() {
    return 'ApphudError{networkIssue: $networkIssue, message: $message, errorCode: $errorCode, billingResponseCode: $billingResponseCode, billingErrorTitle: $billingErrorTitle}';
  }
}
