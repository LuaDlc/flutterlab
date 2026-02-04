import 'package:flutter/material.dart';
import 'package:flutterlab/l10n/app_locale_controller.dart';
import 'package:flutterlab/l10n/app_localizations.dart';
import 'package:flutterlab/router/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterLabApp extends StatelessWidget {
  final AppLocaleController localeController;
  const FlutterLabApp({super.key, required this.localeController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale?>(
      valueListenable: localeController,
      builder: (_, locale, _) {
        if (!localeController.initialized) {
          const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
        return MaterialApp.router(
          locale: locale,
          supportedLocales: const [Locale('pt'), Locale('en'), Locale('es')],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Lab',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,

          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
