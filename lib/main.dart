import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/auth/view_model/auth_view_model.dart';
import 'package:flutter_application_1/auth/model/service/shared_pref.dart';
import 'package:flutter_application_1/auth/view_model/user_provider.dart';
import 'package:flutter_application_1/food/view_model/food_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool userExists = false;
  try {
    Map<String, String> data = await getUserData();
    if (data["email"]!.isNotEmpty && data["password"]!.isNotEmpty) {
      userExists = true;
    }
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => FoodViewModel())
        ],
        child: MyApp(
          userExists: userExists,
        )));
  } catch (e) {
    print(e.toString());
  }
}
