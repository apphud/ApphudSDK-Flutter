import 'dart:convert';

mixin JsonPrintMixin {
  void printAsJson(String methodName, Object object) {
    try {
      //final Map<String, dynamic> json = model.toJson();
      final JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyPrint = encoder.convert(object);
      print('***********************************************************************************');
      print('The result of $methodName:\n $prettyPrint');
      print('***********************************************************************************');
    } catch (e) {
      print('***********************************************************************************');
      print('Error printing $object as result of $methodName, error: ${e.toString()}');
      print('***********************************************************************************');
    }
  }
}
