// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Flutter Lab';

  @override
  String get appSubTitle => 'Playground de estudos Flutter';

  @override
  String get registerTitle => 'Cadastro de Usuário';

  @override
  String get registerSubtitle => 'Validações, foco e regex';

  @override
  String get name => 'Nome';

  @override
  String get email => 'Email';

  @override
  String get password => 'Senha';

  @override
  String get confirmPassword => 'Confirmar senha';

  @override
  String get submit => 'Cadastrar';

  @override
  String get nameError => 'Nome deve ter pelo menos 3 caracteres';

  @override
  String get emailError => 'Email inválido';

  @override
  String get passwordError => 'Senha deve ter no mínimo 8 caracteres';

  @override
  String get confirmPasswordError => 'As senhas não coincidem';

  @override
  String get validRegistration => 'Cadastro válido!';

  @override
  String get highestPrice => 'Maior preço';

  @override
  String get az => 'A a Z';

  @override
  String get simpleList => 'Lista simples';

  @override
  String get groupByCategory => 'Agrupar por categoria';

  @override
  String get removeDuplicates => 'Remover duplicatas';

  @override
  String get mostRecent => 'Mais recente';

  @override
  String get english => 'Inglês';

  @override
  String get spanish => 'Espanhol';

  @override
  String get portuguese => 'Português';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get totalOfItens => 'Total de itens';

  @override
  String get search => 'Buscar produtos';

  @override
  String get reset => 'Redefinir';

  @override
  String get all => 'Todas';

  @override
  String get currencyConverter => 'Conversor de Moeda';

  @override
  String get amount => 'Valor';

  @override
  String get from => 'De';

  @override
  String get to => 'Para';

  @override
  String get clipboardTitle => 'Área de Transferência';

  @override
  String get copy => 'Copiar';

  @override
  String get paste => 'Colar';

  @override
  String get textCopied => 'Texto copiado!';
}
