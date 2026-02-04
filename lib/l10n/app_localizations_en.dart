// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Lab';

  @override
  String get appSubTitle => 'Flutter Study Playground';

  @override
  String get registerTitle => 'User Registration';

  @override
  String get registerSubtitle => 'Validations, focus and regex';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get submit => 'Register';

  @override
  String get nameError => 'Name must have at least 3 characters';

  @override
  String get emailError => 'Invalid email';

  @override
  String get passwordError => 'Password must be at least 8 characters';

  @override
  String get confirmPasswordError => 'Passwords do not match';

  @override
  String get validRegistration => 'Valid Registration!';

  @override
  String get highestPrice => 'Highest Price';

  @override
  String get az => 'A to Z';

  @override
  String get simpleList => 'Simple List';

  @override
  String get groupByCategory => 'Group by category';

  @override
  String get removeDuplicates => 'removeDuplicates';

  @override
  String get mostRecent => 'Most recent';

  @override
  String get english => 'English';

  @override
  String get spanish => 'Spanish';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get totalOfItens => 'Total of items';

  @override
  String get search => 'Search';

  @override
  String get reset => 'Reset';

  @override
  String get all => 'All';

  @override
  String get currencyConverter => 'Conversor de Moeda';

  @override
  String get amount => 'Amount';

  @override
  String get from => 'From';

  @override
  String get to => 'To';
}
