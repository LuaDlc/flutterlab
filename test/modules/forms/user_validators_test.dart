import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlab/modules/forms/validators/user_validators.dart';

void main() {
  setUp(() {});

  group('UserValidators - Nome', () {
    test('Deve retornar erro se nome for inválido', () {
      expect(UserValidators.validateName('Jo'), isNotNull);
    });
    test('Deve retornar null se nome for válido', () {
      expect(UserValidators.validateName('Joao'), isNull);
    });
  });

  group('UserValidators - Email', () {
    test('Deve retornar erro se email for vazio', () {
      expect(UserValidators.validateEmail(''), isNotNull);
    });
    test('Deve retornar erro se email for inválido', () {
      expect(UserValidators.validateEmail('.com'), isNotNull);
    });

    test('Deve retornar null se email for válido', () {
      expect(UserValidators.validateEmail('joao@email.com'), isNull);
    });
  });

  group('UserValidators - Senha', () {
    test('Deve retornar erro se senha for inválido', () {
      expect(UserValidators.validatePassword('123'), isNotNull);
    });

    test('Deve retornar null se senha for válido', () {
      expect(UserValidators.validatePassword('123456'), isNotNull);
    });
  });

  group('UserValidators - confirmação de senha', () {
    test('Deve retornar erro se confirmacao de senha for vazio', () {
      expect(UserValidators.validateConfirmPassword('', '12345678'), isNotNull);
    });
    test(
      'Deve retornar erro se confirmacao de senha for diferente de senha',
      () {
        expect(
          UserValidators.validateConfirmPassword('123477', '12345678'),
          isNotNull,
        );
      },
    );

    test('Deve retornar null se senham forem iguais', () {
      expect(
        UserValidators.validateConfirmPassword('12345678', '12345678'),
        isNull,
      );
    });
  });
}
