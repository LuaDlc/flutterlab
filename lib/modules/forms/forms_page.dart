import 'package:flutter/material.dart';
import 'package:flutterlab/l10n/app_localizations.dart';
import 'package:flutterlab/modules/forms/user_register_form.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Center(
          child: ListTile(
            title: Text(l10n.registerTitle, style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.person),
            subtitle: Text(l10n.registerSubtitle),
          ),
        ),
        UserRegisterForm(),
      ],
    );
  }
}
