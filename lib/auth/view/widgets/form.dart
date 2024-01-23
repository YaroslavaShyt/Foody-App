import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/view_model/auth_view_model.dart';
import 'package:flutter_application_1/auth/view/widgets/button.dart';
import 'package:flutter_application_1/auth/view/widgets/text_field.dart';
import 'package:flutter_application_1/auth/model/service/shared_pref.dart';
import 'package:flutter_application_1/auth/view_model/user_provider.dart';
import 'package:flutter_application_1/food/view/food_view.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const Text(
        "Foody",
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              BuildTextField(
                errorText: Provider.of<AuthViewModel>(context).emailError,
                label: 'Email',
                onChanged: (value) =>
                    Provider.of<AuthViewModel>(context, listen: false).email =
                        value,
              ),
              const SizedBox(height: 40),
              BuildTextField(
                errorText: Provider.of<AuthViewModel>(context).passwordError,
                label: 'Password',
                onChanged: (value) =>
                    Provider.of<AuthViewModel>(context, listen: false)
                        .password = value,
                obscureText: true,
              ),
              const SizedBox(height: 40),
              Button(
                onLoginButtonPressed: _onLoginButtonPressed,
              )
            ],
          ))
    ]);
  }

  void _onLoginButtonPressed(BuildContext context) {
    final isValid =
        Provider.of<AuthViewModel>(context, listen: false).validate(context);
    if (isValid) {
      saveUserData(
        Provider.of<UserProvider>(context, listen: false).user!,
      );
      Navigator.pushReplacementNamed(context, FoodView.id);
    }
  }
}
