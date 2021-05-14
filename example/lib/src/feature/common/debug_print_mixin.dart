import 'dart:convert';

import 'package:flutter/foundation.dart';

mixin DebugPrintMixin {
  static const String _doubleDivider =
      '\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}\u{2550}';
  static const String _singleDivider =
      '\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}';
  static const int _width = 80;

  void printAsJson(String methodName, Object? object,
      {bool printOnlyMethodName = false}) {
    try {
      final String title =
          printOnlyMethodName ? methodName : 'The result of $methodName';
      final JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyPrint = encoder.convert(object);
      _printUpDivider();
      final String borderedString = _addBorders(prettyPrint);
      debugPrint(_addBorders(title));
      _printMiddleDivider();
      debugPrint(borderedString);
      _printDownDivider();
    } catch (e) {
      _printUpDivider();
      debugPrint(
        'Failed to print $object as result of $methodName, '
        'error: ${e.toString()}',
      );
      _printDownDivider();
    }
  }

  String _addBorders(String src) {
    final List<String> lines = src.split('\n');
    final List<String> borderedLines = lines.map((line) {
      final StringBuffer buffer = StringBuffer();
      buffer.write('\u{2551}');
      buffer.write(line.replaceAll('\n', ''));
      for (int i = line.length; i < _width; i++) {
        buffer.write(' ');
      }
      buffer.write('\u{2551}\n');
      return buffer.toString();
    }).toList();

    return borderedLines.join().replaceAll(RegExp(r'\n$'), '');
  }

  void _printUpDivider() {
    debugPrint('\u{2554}$_doubleDivider\u{2557}');
  }

  void _printMiddleDivider() {
    debugPrint('\u{255F}$_singleDivider\u{2562}');
  }

  void _printDownDivider() {
    debugPrint('\u{255A}$_doubleDivider\u{255D}');
  }

  void printError(String methodName, Object error) {
    try {
      _printUpDivider();
      debugPrint(_addBorders('The result of $methodName is error'));
      _printMiddleDivider();
      debugPrint(_addBorders(error.toString()));
      _printDownDivider();
    } catch (e) {
      _printUpDivider();
      debugPrint(
        'Failed to print error as result of $methodName, '
        'error: ${e.toString()}',
      );
      _printDownDivider();
    }
  }
}
