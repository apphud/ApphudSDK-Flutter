import 'package:json_annotation/json_annotation.dart';

part 'android_account_identifiers_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class AndroidAccountIdentifiersWrapper {
  final String obfuscatedAccountId;
  final String obfuscatedProfileId;

  AndroidAccountIdentifiersWrapper({
    required this.obfuscatedAccountId,
    required this.obfuscatedProfileId,
  });

  Map<String, dynamic> toJson() =>
      _$AndroidAccountIdentifiersWrapperToJson(this);

  factory AndroidAccountIdentifiersWrapper.fromJson(
          Map<dynamic, dynamic> json) =>
      _$AndroidAccountIdentifiersWrapperFromJson(json);

  @override
  String toString() {
    return 'AndroidAccountIdentifiersWrapper{obfuscatedAccountId: $obfuscatedAccountId, obfuscatedProfileId: $obfuscatedProfileId}';
  }
}
