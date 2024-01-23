import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData(UserModel user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("email", user.email);
  await prefs.setString("password", user.password);
}

Future<Map<String, String>> getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, String> data = {};
  data["email"] = prefs.getString("email") ?? '';
  data["password"] = prefs.getString("password") ?? '';
  return data;
}
