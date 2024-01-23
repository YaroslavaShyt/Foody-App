import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/view/auth_view.dart';
import 'package:flutter_application_1/core/app_router.dart';
import 'package:flutter_application_1/food/view/food_view.dart';

class MyApp extends StatelessWidget {
  final bool userExists;
  final AppRouter router = AppRouter();
  MyApp({super.key, required this.userExists});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: router.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Foody',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 58, 183, 129)),
          useMaterial3: true,
        ),
        home: userExists ? const FoodView() : const AuthView());
  }
}
