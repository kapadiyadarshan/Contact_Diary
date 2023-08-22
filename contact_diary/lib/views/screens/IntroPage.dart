import 'package:contact_diary/Helpers/Login_helper.dart';
import 'package:contact_diary/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogin(
          onLogin: (value) {
            LoginHelper.loginHelper.LogIn();
            Navigator.pushReplacementNamed(context, MyRoutes.HomePage);
          },
          onRecoverPassword: (value) {},
        ),
      ),
    );
  }
}
