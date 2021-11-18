// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.cyan,
      fontFamily: GoogleFonts.poppins().fontFamily,
      dividerColor: Colors.black,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonTheme: ButtonThemeData(buttonColor: Colors.amber),
      backgroundColor: Colors.cyan,
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(Colors.indigo))),
      textTheme: TextTheme(
          subtitle2:
              TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 11)),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 4.0,
        iconTheme: IconThemeData(color: Colors.cyan),
        // titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20),
        // textTheme: Theme.of(context).textTheme,
      ));
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: lightBluishColor,
      dividerColor: Colors.white,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      // buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
      textTheme: TextTheme(
          subtitle2:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
              lightBluishColor), //code to change floating button color. ignored it bcz default color was best choice.
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(Colors.amber))),
      // accentColor: ,
      // colorScheme: ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcreamColor = Colors.grey.shade900;
  static Color lightBluishColor = Colors.blue;

  // Color primary = const Color(0xffbb86fc);
  // Color primaryVariant = const Color(0xff3700B3);
  // Color secondary = const Color(0xff03dac6);
  // Color secondaryVariant = const Color(0xff03dac6);
  // Color surface = const Color(0xff121212);
  // Color background = const Color(0xff121212);
  // Color error = const Color(0xffcf6679);
}
