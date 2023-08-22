import 'package:contact_diary/Controllers/Theme_Contoller.dart';
import 'package:contact_diary/Helpers/Login_helper.dart';
import 'package:contact_diary/utils/routes_utils.dart';
import 'package:contact_diary/views/screens/HomePage.dart';
import 'package:contact_diary/views/screens/IntroPage.dart';
import 'package:contact_diary/views/screens/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  LoginHelper.loginHelper.init(preferences: preferences);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      themeMode: Provider.of<ThemeController>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: LoginHelper.loginHelper.isLoggedIn()
          ? MyRoutes.HomePage
          : MyRoutes.IntroPage,
      routes: {
        MyRoutes.IntroPage: (context) => const IntroPage(),
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.SettingPage: (context) => const SettingPage(),
      },
    );
  }
}
