import 'package:flutter/material.dart';
import 'package:contact_app/core/util/color_palette.dart';

ThemeData mytheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorPalette.darkBlue,
    appBarTheme: AppBarTheme(
        foregroundColor: ColorPalette.gold,
        backgroundColor: ColorPalette.darkBlue,
        titleTextStyle: TextStyle()),
    textTheme: TextTheme(

      titleLarge: TextStyle(
          fontSize: 20, color: ColorPalette.gold, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 16, color: ColorPalette.gold, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 10, color: ColorPalette.gold),
      bodyLarge: TextStyle(color: ColorPalette.gold, fontSize: 18),
    ),

    //titleMedium: TextStyle(fontSize: 18, color: ColorPalette.white,fontWeight: FontWeight.bold),

    //  headlineLarge: TextStyle(fontSize: 48,fontWeight: FontWeight.bold,color: ColorPalette.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor:ColorPalette.gold,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16) , side: BorderSide(color:ColorPalette.gold ,width: 2 )),
          foregroundColor: ColorPalette.darkBlue,
          backgroundColor: ColorPalette.gold,
          padding: const EdgeInsets.all(16),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 20,

          ),
          alignment: Alignment.center,
          overlayColor: ColorPalette.transperant),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      fillColor: ColorPalette.darkBlue,
      hintStyle: TextStyle(fontSize: 14, color: ColorPalette.lightBlue),
      filled: true,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: ColorPalette.gold),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: ColorPalette.gold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: ColorPalette.gold),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: ColorPalette.red),
      ),
    ),

  );
  // iconButtonTheme: IconButtonThemeData(
  //     style: IconButton.styleFrom(
  //         backgroundColor: ColorPalette.red,
  //         foregroundColor: ColorPalette.white,
  //         iconSize: 22)));
}
