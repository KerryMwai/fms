
import 'package:flutter/material.dart';

class FmsChanageNotifier extends ChangeNotifier {
  bool _hasAccount = false;

  bool get accountdecision => _hasAccount;

  bool _isCheckedSuperAdmin = false;
  bool _isCheckedAdmin = false;
  bool _isCheckedUser = false;

  bool get isCheckedSuperAdmin => _isCheckedSuperAdmin;
  bool get isCheckedAdmin => _isCheckedAdmin;
  bool get isCheckedUser => _isCheckedUser;

  hasaccount() {
    _hasAccount = true;
    notifyListeners();
  }

  dontHaveAccount() {
    _hasAccount = false;
    notifyListeners();
  }

  isCheckedRoledSuperAdmin(value) {
    _isCheckedSuperAdmin = value;
    notifyListeners();
  }

  isCheckedRoleAdmin(value) {
    _isCheckedAdmin = value;
    notifyListeners();
  }

  isCheckedRoleUser(value) {
    _isCheckedUser = value;
    notifyListeners();
  }
}
