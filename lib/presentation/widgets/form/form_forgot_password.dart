import 'package:flutter/material.dart';

class FormForgotPassword extends StatelessWidget {
  const FormForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/recover_by_email'),
      child: Text(
        'Forgot Password?',
        style: _themeData.textTheme.caption?.apply(
          color: _themeData.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
