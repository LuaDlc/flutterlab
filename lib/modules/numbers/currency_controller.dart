import 'package:flutter/material.dart';

class CurrencyController extends ChangeNotifier {
  double _amount = 0.0;
  String _from = 'BRL';
  String _to = 'USD';

  double get amount => _amount;
  String get from => _from;
  String get to => _to;

  void setAmount(String value) {
    _amount = double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
    notifyListeners();
  }

  void setFrom(String? value) {
    _from = value!;
    notifyListeners();
  }

  void setTo(String? value) {
    _to = value!;
    notifyListeners();
  }

  double convert() {
    const rates = {
      'BRL_USD': 0.20,
      'USD_BRL': 5.0,
      'BRL_EUR': 0.18,
      'EUR_BRL': 5.14,
    };

    return _amount * (rates['${_from}_$_to'] ?? 1);
  }
}
