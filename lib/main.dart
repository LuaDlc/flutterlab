import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab/app.dart';
import 'package:flutterlab/firebase_options.dart';
import 'package:flutterlab/l10n/app_locale_controller.dart';

final appLocaleController = AppLocaleController();
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await  FirebaseAnalytics.instance.logEvent(
  name: 'debug_test_event',
);
  await appLocaleController.loadSavedLocale();
  runApp(FlutterLabApp(localeController: appLocaleController));
}
