import 'package:flutter/material.dart';
import 'package:install_check/core/store.dart';
import 'package:install_check/pages/cart_page.dart';
import 'package:install_check/pages/home_page.dart';
import 'package:install_check/pages/login_page.dart';
import 'package:install_check/utils/routes.dart';
import 'package:install_check/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.DarkTheme(context),
      // (
      //   // Theme is the settings for light theme
      // ),
      themeMode: ThemeMode.light, // themeMode: ThemeMode.dark,  for dark theme
      darkTheme: MyThemes.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      // home: HomePage(),
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
