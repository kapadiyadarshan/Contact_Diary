import 'package:contact_diary/utils/routes_utils.dart';
import 'package:contact_diary/views/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
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
          backgroundColor: Color(0xff38C9C4),
          foregroundColor: Color(0xffffffff),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: MyRoutes.HomePage,
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
      },
    );
  }
}
