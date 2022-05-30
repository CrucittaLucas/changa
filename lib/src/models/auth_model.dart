import 'package:changa/src/ee/user.dart';
import 'package:flutter/cupertino.dart';

class AuthModel with ChangeNotifier {
  User? _userLogged;
  User? get userLogged => _userLogged;
  set userLogged(User? value) {
    _userLogged = value;
    notifyListeners();
  }

  logout(
    BuildContext context,
  ) {
    _userLogged = null;
  }
}
