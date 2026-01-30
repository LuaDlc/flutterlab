import 'package:flutter/material.dart';
import 'package:flutterlab/modules/forms/validators/user_validators.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({super.key});

  @override
  State<UserRegisterForm> createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormFieldState<String>>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _repeatPasswordFocus = FocusNode();

  bool _obscured = true;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool _isFormValid = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _repeatPasswordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autoValidateMode = AutovalidateMode.onUserInteraction;
    });
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cadastro válido 🎉')));
    }
  }

  void _updateFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid != _isFormValid) {
      setState(() {
        _isFormValid = isValid;
      });
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
            autovalidateMode: _autoValidateMode,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _nameFocus,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocus);
                    },
                    decoration: InputDecoration(
                      hintText: 'Nome *',
                      labelText: 'Nome *',
                    ),
                    controller: TextEditingController(
                      text: _nameController.text,
                    ),

                    validator: (value) => UserValidators.validateName(value),

                    onChanged: (_) => _updateFormValidity(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocus,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocus);
                    },

                    decoration: InputDecoration(
                      hintText: 'email *',
                      labelText: 'email *',
                    ),
                    controller: _emailController,

                    validator: UserValidators.validateEmail,
                    onChanged: (_) => _updateFormValidity(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _passwordFocus,
                    obscureText: _obscured,
                    decoration: InputDecoration(
                      hintText: 'senha *',
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
                    controller: _passwordController,

                    validator: (value) =>
                        UserValidators.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    key: _confirmPasswordKey,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: _repeatPasswordFocus,
                    obscureText: _obscured,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_repeatPasswordFocus);
                    },
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
                    controller: _repeatPasswordController,

                    validator: (value) =>
                        UserValidators.validateConfirmPassword(
                          value,
                          _repeatPasswordController.text,
                        ),
                    onChanged: (_) {
                      _confirmPasswordKey.currentState?.validate();
                      _updateFormValidity();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isFormValid ? _submit : null,
            child: const Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
