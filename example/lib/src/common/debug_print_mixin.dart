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
          _addBorders('Failed to print $object as result of $methodName'));
      _printMiddleDivider();
      debugPrint(_addBorders(e.toString()));
      _printDownDivider();
    }
  }

  String _addBorders(String src) {
    final List<String> lines = src.split('\n');
    final List<String> borderedLines = lines.map((line) {
      final StringBuffer buffer = StringBuffer();
      final String clearedLine = line.replaceAll('\n', '');
      final List<String> rangedLines = splitByLength(clearedLine, _width);

      rangedLines.forEach((rangedLine) {
        buffer.write('\u{2551}');
        buffer.write(rangedLine);
        for (int i = rangedLine.length; i < _width; i++) {
          buffer.write(' ');
        }
        buffer.write('\u{2551}\n');
      });

      return buffer.toString();
    }).toList();

    return borderedLines.join().replaceAll(RegExp(r'\n$'), '');
  }

  List<String> splitByLength(String src, int length) {
    if (length <= 0) return [src];
    final List<String> result = [];
    final int stepsCount = src.length ~/ length;
    for (int step = 0; step < stepsCount; step++) {
      result.add(src.substring(step * length, (step + 1) * length));
    }
    if (src.length % length != 0) {
      result.add(src.substring(stepsCount * length));
    }
    return result;
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
      debugPrint(_addBorders('Failed to print error as result of $methodName'));
      _printMiddleDivider();
      debugPrint(_addBorders(e.toString()));
      _printDownDivider();
    }
  }
}
