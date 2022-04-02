import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  int? _phone;
  int? get phone => _phone;

  void setPhone(input) {
    _phone = input;
    notifyListeners();
  }
}
