import 'package:flutter/material.dart';
import 'package:install_check/pages/home_page.dart';
import 'package:install_check/pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Theme is the settings for light theme
        primarySwatch: Colors.pink,
      ),
      themeMode: ThemeMode.light, // themeMode: ThemeMode.dark,  for dark theme
      darkTheme: ThemeData(
        // darkTheme is the setting for dark theme
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      // home: HomePage(),
      routes: {"/": (context) => LoginPage(), "/home": (context) => HomePage()},
    );
  }
}
