import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:flutter_application_1/auth/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class AuthViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String? _emailError;
  String? _passwordError;

  bool get isValid => _emailError == null && _passwordError == null;

  set email(String value) {
    _email = value.trim();
    _emailError = null;
  }

  set password(String value) {
    _password = value.trim();
    _passwordError = null;
  }

  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  bool validate(BuildContext context) {
    
    if (_email.isEmpty) {
      _emailError = 'Email is required!';
    } else if (!isValidEmail(_email)) {
      _emailError = 'Invalid email format!';
    }

    if (_password.isEmpty) {
      _passwordError = 'Password is required!';
    } else if (_password.length < 5) {
      _passwordError = 'Password must be at least 5 characters!';
    }

    
    if (_emailError != null || _passwordError != null) {
      notifyListeners();
      return false;
    }

    Provider.of<UserProvider>(context, listen: false).setUser(UserModel(email: _email, password: _password));
    return true;
  }

  bool isValidEmail(String email) {
    return email.contains('@');
  }
}

