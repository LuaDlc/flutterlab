import 'package:flutter/material.dart';
import 'package:flutterlab/core/services/locale_storage.dart';

class AppLocaleController extends ValueNotifier<Locale?> {
  AppLocaleController() : super(null);

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> loadSavedLocale() async {
    final locale = await LocaleStorage.load();
    value = locale;
    _initialized = true;
  }

  Future<void> setLocaleShared(Locale locale) async {
    value = locale;
    await LocaleStorage.save(locale);
  }

  void setLocale(Locale locale) {
    value = locale;
  }

  Locale localeFromString(String value) {
    switch (value) {
      case 'english':
        return const Locale('en');

      case 'spanish':
        return const Locale('es');
      case 'portuguese':
      default:
        return const Locale('pt');
    }
  }
}
