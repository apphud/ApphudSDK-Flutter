import 'package:json_annotation/json_annotation.dart';

part 'apphud_group.g.dart';

@JsonSerializable(anyMap: true)
class ApphudGroup {
  final String name;
  final List<String> productIds;
  final bool hasAccess;

  ApphudGroup({
    required this.name,
    required this.hasAccess,
    required this.productIds,
  });

  factory ApphudGroup.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudGroupFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudGroupToJson(this);

  @override
  String toString() {
    return 'ApphudGroup{name: $name, productIds: $productIds, hasAccess: $hasAccess}';
  }
}
