import 'package:contact_diary/Controllers/Theme_Contoller.dart';
import 'package:contact_diary/utils/routes_utils.dart';
import 'package:contact_diary/views/screens/HomePage.dart';
import 'package:contact_diary/views/screens/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: Provider.of<ThemeController>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: MyRoutes.HomePage,
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.SettingPage: (context) => const SettingPage(),
      },
    );
  }
}
