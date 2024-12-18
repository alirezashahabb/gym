import 'package:flutter/material.dart';

class CustomColors {
  static const kGreenColor = Color(0xff66caa6);
  static const kRedColor = Color(0xfffa6060);
  static const kWhiteColor = Color(0xffffffff);
  static const kPrimaryColor = Color(0xff60a5fa);
  static const kLightBlackColor = Color(0xff252525);
  static const kBlackColor = Color(0xff000000);

  static const kLightGreyColor = Color(0xff828282);
  static const kDarkGreyColor = Color(0xff414141);
  static const kMilkyColor = Color(0xfffafafa);
  static const kLightCardColor = Color(0xfff2f2f2);
  static const kDarkCardColor = Color(0xff414141);
}

ThemeData lightTheme(String fontName) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(12),
      filled: true,
      fillColor: CustomColors.kMilkyColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: CustomColors.kLightGreyColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: CustomColors.kPrimaryColor,
        ),
      ),
    ),
    useMaterial3: false,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: CustomColors.kBlackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CustomColors.kBlackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CustomColors.kLightGreyColor,
      ),
    ),
    fontFamily: fontName,
    scaffoldBackgroundColor: CustomColors.kMilkyColor,
    colorScheme: const ColorScheme.light(
      primary: CustomColors.kPrimaryColor,
      onPrimary: CustomColors.kWhiteColor,
      secondary: CustomColors.kWhiteColor,
      onSecondary: CustomColors.kBlackColor,
      tertiary: CustomColors.kLightCardColor,
    ),
  );
}

ThemeData darkTheme(String fontName) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(12),
      filled: true,
      fillColor: CustomColors.kLightBlackColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: CustomColors.kLightGreyColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: CustomColors.kPrimaryColor,
        ),
      ),
    ),
    useMaterial3: false,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: CustomColors.kWhiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CustomColors.kWhiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CustomColors.kLightGreyColor,
      ),
    ),
    fontFamily: fontName,
    scaffoldBackgroundColor: CustomColors.kLightBlackColor,
    colorScheme: const ColorScheme.dark(
      primary: CustomColors.kPrimaryColor,
      onPrimary: CustomColors.kWhiteColor,
      secondary: CustomColors.kBlackColor,
      onSecondary: CustomColors.kWhiteColor,
      tertiary: CustomColors.kDarkCardColor,
    ),
  );
}
