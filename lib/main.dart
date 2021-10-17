import 'package:flutter/material.dart';
import 'package:install_check/pages/home_page.dart';
import 'package:install_check/pages/login_page.dart';
import 'package:install_check/utils/routes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Theme is the settings for light theme
        primarySwatch: Colors.cyan,
      ),
      themeMode: ThemeMode.light, // themeMode: ThemeMode.dark,  for dark theme
      darkTheme: ThemeData(
        // darkTheme is the setting for dark theme
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      // home: HomePage(),
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
