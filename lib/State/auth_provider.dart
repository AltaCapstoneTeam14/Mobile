import 'package:capstone_project/api/auth_service.dart';
import 'package:capstone_project/Api/user_service.dart';
import 'package:capstone_project/Model/Login/Request/login_model.dart';
import 'package:capstone_project/Model/Login/Response/login_response.dart';
import 'package:capstone_project/Model/Register/Request/register_model.dart';
import 'package:capstone_project/Model/Register/Response/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  AuthService authService = AuthService();
  UserService userService = UserService();
  String? _idToken;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != null) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<RegisterResponse?> addUser(RegisterModel registerModel) async {
    final response = await authService.register(registerModel);
    return response;
  }

  Future<LoginResponse?> loginUser(LoginModel loginModel) async {
    final response = await authService.login(loginModel);

    if (response?.data != null) {
      _idToken = response?.data!['token'];
      final sharePref = await SharedPreferences.getInstance();
      sharePref.setString('authData', _idToken!);
    }
    notifyListeners();
    return response;
  }

  Future<void> logout() async {
    _idToken = null;

    final pref = await SharedPreferences.getInstance();
    pref.clear();

    notifyListeners();
  }

  autoLogin() async {
    final pref = await SharedPreferences.getInstance();
    final getData = await userService.getUser();

    final myData = pref.getString('authData');
    if (!pref.containsKey('authData')) {
      return false;
    }

    _idToken = myData;

    if (getData.status == 401) {
      logout();
    }
    // _autologout;
    notifyListeners();
    return true;
  }
}
