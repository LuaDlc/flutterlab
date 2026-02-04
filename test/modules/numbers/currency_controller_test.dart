import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlab/modules/numbers/currency_controller.dart';

void main() {
  group('CurrencyController', () {
    test('converts BRL to USD correctly', () {
      final controller = CurrencyController();

      controller.setAmount('10');
      controller.setFrom('BRL');
      controller.setTo('USD');

      final result = controller.convert();

      expect(result, 2.0);
    });

    test('converts USD to BRL correctly', () {
      final controller = CurrencyController();

      controller.setAmount('10');
      controller.setFrom('USD');
      controller.setTo('BRL');

      final result = controller.convert();

      expect(result, 50.0);
    });

    test('uses fallback rate when pair not found', () {
      final controller = CurrencyController();

      controller.setAmount('10');
      controller.setFrom('EUR');
      controller.setTo('EUR');

      final result = controller.convert();

      expect(result, 10.0);
    });

    test('invalid input results in zero', () {
      final controller = CurrencyController();

      controller.setAmount('abc');

      expect(controller.amount, 0.0);
    });

    test('comma decimal is parsed correctly', () {
      final controller = CurrencyController();

      controller.setAmount('10,5');

      expect(controller.amount, 10.5);
    });
  });
}
