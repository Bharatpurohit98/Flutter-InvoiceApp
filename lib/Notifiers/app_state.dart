import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
   AppState();

  String? _empty = '';
  String? get empty => _empty;

  void setEmpty(input) {
    _empty = input;
    notifyListeners();
  }

  String? _bussinessName = '';
  String? get bussinessName => _bussinessName;

  void setBussinessName(String input) {
    _bussinessName = input;
    notifyListeners();
  }

  String? get getBussinessName => _bussinessName;

  int? _phoneNumber;
  int? get phoneNumber => _phoneNumber;

  // void setNumber(int input) {
  //   _number = input.toString();
  //   notifyListeners();
  // }

  // String? get getNumber => _number;

  void setPhoneNumber(int input) {
    _phoneNumber = input;
    notifyListeners();
  }

  int? get getPhoneNumber => _phoneNumber;

  String? _email = '';
  String? get email => _email;

  void setEmail(String input) {
    _email = input;
    notifyListeners();
  }

  String? get getEmail => _email;

  String? _gst;
  String? get gst => _gst;

  void setGst(String input) {
    _gst = input;
    notifyListeners();
  }

  String? get getGst => _gst;

  String? _address = '';
  String? get address => _address;

  void setAddress(String input) {
    _address = input;
    notifyListeners();
  }

  String? get getAddress => _address;

  String? _description;
  String? get description => _description;

  void setDescription(String input) {
    _description = input;
    notifyListeners();
  }

  String? get getDescription => _description;
}
