import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:placement_reminders/constans/app_constants.dart';

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        fontFamily: Font.nunito,
        canvasColor: Colors.white,
        primarySwatch: Colors.indigo,
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        fontFamily: Font.nunito,
        canvasColor: Colors.white,
        primarySwatch: Colors.indigo,
      );
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        fontFamily: Font.nunito,
        primarySwatch: Colors.blue,
        canvasColor: darkCreamColor,
        secondaryHeaderColor: yellowColor,
        buttonColor: lightBluishColor,
        accentColor: Colors.white,
      );
  static Color blueColor = Color(0xFF35B9C0);
  static Color yellowColor = Color(0xFFFDD535);
  static Color orangeColor = Color(0xFFF17204);
  static Color greenColor = Color(0xFF8DC55F);
  static Color blackColor = Color(0xFF000000);

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6:
                  context.textTheme.headline6?.copyWith(color: Colors.white),
            ),
      ));

  //Colors
  static Color blueColor = Color(0xFF35B9C0);
  static Color yellowColor = Color(0xFFFDD535);
  static Color orangeColor = Color(0xFFF17204);
  static Color greenColor = Color(0xFF8DC55F);
  static Color blackColor = Color(0xFF000000);

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
