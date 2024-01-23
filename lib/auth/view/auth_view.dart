import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/view/widgets/form.dart';

class AuthView extends StatelessWidget {
  static const String id = "auth";

  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height - 300,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: const LoginForm(),
            ),
          ),
        );
      
    
  }
}
