import 'package:shared_preferences/shared_preferences.dart';

class LoginHelper {
  LoginHelper._();

  static final LoginHelper loginHelper = LoginHelper._();

  late SharedPreferences preferences;

  init({required SharedPreferences preferences}) {
    this.preferences = preferences;
  }

  bool isLoggedIn() {
    return preferences.getBool("Login") ?? false;
  }

  void LogIn() {
    preferences.setBool("Login", true);
  }
}
