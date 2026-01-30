class UserValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().length < 3) {
      return 'Nome deve ter pelo menos 3 caracteres';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email obrigatório';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'Senha deve ter no mínimo 8 caracteres';
    }
    return null;
  }

  static String? validateConfirmPassword(String? confirm, String password) {
    if (confirm == null || confirm.isEmpty) {
      return 'Confirme a senha';
    }
    if (confirm != password) {
      return 'As senhas não coincidem';
    }
    return null;
  }
}
