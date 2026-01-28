import 'package:flutter/material.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({super.key});

  @override
  State<UserRegisterForm> createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _obscured = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cadastro válido 🎉')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome *',
                      labelText: 'Nome *',
                    ),
                    controller: TextEditingController(
                      text: _nameController.text,
                    ),

                    validator: (value) {
                      if (value == null || value.trim().length < 3) {
                        return 'O nome de conter ao menos 3 caracteres';
                      }

                      return null;
                    },
                    onChanged: (value) => _nameController.text = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    inputFormatters: [],
                    decoration: InputDecoration(
                      hintText: 'email *',
                      labelText: 'email *',
                    ),
                    controller: TextEditingController(
                      text: _emailController.text,
                    ),

                    validator: (value) {
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );

                      if (value == null ||
                          emailRegex.hasMatch(value) == false) {
                        return 'Coloque um email válido';
                      }

                      return null;
                    },
                    onChanged: (value) {
                      _emailController.text = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    obscureText: _obscured,
                    decoration: InputDecoration(
                      hintText: 'senh *',
                      labelText: 'senha *',

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscured = !_obscured;
                          });
                        },
                        icon: Icon(
                          _obscured ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    controller: TextEditingController(
                      text: _passwordController.text,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma senha';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter no minimo 6 caracteres';
                      }
                      return null;
                    },
                    onChanged: (value) => _passwordController.text = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    obscureText: _obscured,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscured = !_obscured;
                          });
                        },
                        icon: Icon(
                          _obscured ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      hintText: 'senha *',
                      labelText: 'senha *',
                    ),
                    controller: TextEditingController(
                      text: _repeatPasswordController.text,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Repita uma senha';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter no minimo 6 caracteres';
                      }
                      if (value != _passwordController.text) {
                        return 'As senhas não coincidem';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        _repeatPasswordController.text = value,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _submit, child: const Text('Cadastrar')),
        ],
      ),
    );
  }
}
