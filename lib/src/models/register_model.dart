import 'package:flutter/material.dart';

class RegisterModel with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  clear() {
    _currentPage = 0;
    _name = '';
    _lastName = '';
    // _gender = '';
    // _motivation = '';
    // _categoryId = '';
    // _affirmation = null;
    notifyListeners();
  }
  // int _numberPhone = 0;
  // int get numberPhone => _numberPhone;
  // set numberPhone(int value) {
  //   _numberPhone = value;
  //   notifyListeners();
  // }
}
