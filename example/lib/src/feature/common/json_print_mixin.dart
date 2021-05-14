import 'dart:convert';

mixin DebugPrintMixin {
  void printAsJson(String methodName, Object object) {
    try {
      final JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyPrint = encoder.convert(object);
      _printDivider();
      print('The result of $methodName:\n $prettyPrint');
      _printDivider();
    } catch (e) {
      _printDivider();
      print(
        'Failed to printing $object as result of $methodName, '
        'error: ${e.toString()}',
      );
      _printDivider();
    }
  }

  void _printDivider() {
    print('*****************************************************************');
  }

  void printError(String methodName, Object error) {
    try {
      _printDivider();
      print('The result of $methodName is error:\n${error.toString()}');
      _printDivider();
    } catch (e) {
      _printDivider();
      print(
        'Failed to print error as result of $methodName, '
        'error: ${e.toString()}',
      );
      _printDivider();
    }
  }
}
