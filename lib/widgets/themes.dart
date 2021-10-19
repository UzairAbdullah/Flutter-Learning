// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.cyan,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 4.0,
        iconTheme: IconThemeData(color: Colors.cyan),
        // titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20),
        // textTheme: Theme.of(context).textTheme,
      ));
  static ThemeData DarkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
