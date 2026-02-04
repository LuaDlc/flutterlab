import 'package:flutter/material.dart';
import 'package:flutterlab/app.dart';
import 'package:flutterlab/l10n/app_locale_controller.dart';

final appLocaleController = AppLocaleController();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appLocaleController.loadSavedLocale();
  runApp(FlutterLabApp(localeController: appLocaleController));
}
