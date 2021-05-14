import 'package:json_annotation/json_annotation.dart';

part 'apphud_error.g.dart';

@JsonSerializable(anyMap: true)
class ApphudError {
  final String? message;
  final int? errorCode;

  ApphudError({
    this.message,
    this.errorCode,
  });

  factory ApphudError.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudErrorFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudErrorToJson(this);

  @override
  String toString() {
    return 'ApphudError{message: $message, errorCode: $errorCode}';
  }
}
