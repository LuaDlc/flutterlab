import 'package:flutter/material.dart';
import 'package:flutterlab/l10n/app_localizations.dart';
import 'package:flutterlab/main.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Text(l10n.language, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),

          _languageTile(
            context,
            label: l10n.english,
            locale: const Locale('en'),
          ),
          _languageTile(
            context,
            label: l10n.spanish,
            locale: const Locale('es'),
          ),
          _languageTile(
            context,
            label: l10n.portuguese,
            locale: const Locale('pt'),
          ),
        ],
      ),
    );
  }

  Widget _languageTile(
    BuildContext context, {
    required String label,
    required Locale locale,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          appLocaleController.setLocale(locale);
          context.go('/');
        },
      ),
    );
  }
}
