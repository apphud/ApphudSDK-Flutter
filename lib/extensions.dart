extension MapConvertExtension on Map<dynamic, dynamic> {
  Map<String, dynamic> get toStringKeyMap => Map<String, dynamic>.from(this);
}

extension MapListConvertExtension on List<dynamic> {
  List<Map<dynamic, dynamic>> get toMapList =>
      List<Map<dynamic, dynamic>>.from(this);
}
