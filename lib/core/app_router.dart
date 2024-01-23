import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/view/auth_view.dart';
import 'package:flutter_application_1/food/view/food_view.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case AuthView.id:
        return MaterialPageRoute(builder: (_) => const AuthView());
      case FoodView.id:
        return MaterialPageRoute(builder: (_)=> const FoodView());
      default:
      return null;
    }
  }
}