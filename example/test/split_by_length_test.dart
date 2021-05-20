import 'package:apphud_example/src/feature/common/debug_print_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

class TestSplitter with DebugPrintMixin {}

void main() {
  test('Split string by length test', () {
    final TestSplitter testSplitter = TestSplitter();
    final String src = 'qazwsxcderfvbgt';
    final List<String> splitResult1 = testSplitter.splitByLength(src, 3);
    expect(splitResult1.length, 5);
    expect(splitResult1[0], 'qaz');
    expect(splitResult1[1], 'wsx');
    expect(splitResult1[2], 'cde');
    expect(splitResult1[3], 'rfv');
    expect(splitResult1[4], 'bgt');

    final List<String> splitResult2 = testSplitter.splitByLength(src, 8);
    expect(splitResult2.length, 2);
    expect(splitResult2[0], 'qazwsxcd');
    expect(splitResult2[1], 'erfvbgt');
  });
}
