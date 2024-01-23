import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onLoginButtonPressed;
  const Button({super.key, required this.onLoginButtonPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: () => onLoginButtonPressed(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
