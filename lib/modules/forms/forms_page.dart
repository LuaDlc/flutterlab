import 'package:flutter/material.dart';
import 'package:flutterlab/modules/forms/user_register_form.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: const ListTile(
            title: Text('Cadastro de usuários', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.person),
            subtitle: Text('Validações, foco e regex'),
          ),
        ),
        UserRegisterForm(),
      ],
    );
  }
}
