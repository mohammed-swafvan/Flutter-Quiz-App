import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: CustomColor.kPrimaryColor,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    scaffoldBackgroundColor: CustomColor.kWhiteColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: CustomColor.kBlackColor,
      ),
      bodySmall: TextStyle(
        color: CustomColor.kBlackColor,
      ),
      bodyMedium: TextStyle(
        color: CustomColor.kBlackColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(kEdgeInsetsVer12),
        foregroundColor: WidgetStateProperty.all<Color>(CustomColor.kWhiteColor),
        backgroundColor: WidgetStateProperty.all<Color>(CustomColor.kPrimaryColor),
        elevation: WidgetStateProperty.all<double>(4.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: kBorderRadius10,
          ),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: CustomColor.kPrimaryColor,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    scaffoldBackgroundColor: CustomColor.kBlackColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: CustomColor.kWhiteColor,
      ),
      bodySmall: TextStyle(
        color: CustomColor.kWhiteColor,
      ),
      bodyMedium: TextStyle(
        color: CustomColor.kWhiteColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(kEdgeInsetsVer12),
        foregroundColor: WidgetStateProperty.all<Color>(CustomColor.kWhiteColor),
        backgroundColor: WidgetStateProperty.all<Color>(CustomColor.kPrimaryColor),
        elevation: WidgetStateProperty.all<double>(4.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: kBorderRadius10,
          ),
        ),
      ),
    ),
  );
}
