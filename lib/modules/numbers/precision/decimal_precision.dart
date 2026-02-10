import 'package:decimal/decimal.dart';

Decimal calculateWithDecimal() {
  Decimal total = Decimal.zero;

  for (int i = 0; i < 10; i++) {
    total += Decimal.parse('0.1');
  }

  return total;
}
