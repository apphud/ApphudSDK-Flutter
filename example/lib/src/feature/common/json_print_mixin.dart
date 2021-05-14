import 'dart:convert';

mixin JsonPrintMixin {
  void printAsJson(dynamic model) {
    try {
      final Map<String, dynamic> json = model.toJson();
      final JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyPrint = encoder.convert(json);
      print(prettyPrint);
    } catch (e) {
      print('Error printing $model as json: ${e.toString()}');
    }
  }
}
