import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlab/modules/numbers/precision/double_precision.dart';
import 'package:flutterlab/modules/numbers/precision/decimal_precision.dart';
import 'package:decimal/decimal.dart';

void main() {
  test('double precision is inaccurate for financial sums', () {
    final result = calculateWithDouble();
    expect(result, isNot(1.0));
  });

  test('decimal precision is exact for financial sums', () {
    final result = calculateWithDecimal();
    expect(result, Decimal.parse('1.0'));
  });
}
