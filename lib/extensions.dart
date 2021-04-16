extension MapListConvertExtension on List<dynamic> {
  List<Map<dynamic, dynamic>> get toMapList =>
      List<Map<dynamic, dynamic>>.from(this);
}
