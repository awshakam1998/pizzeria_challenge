import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  static  Color _scaffoldColor = Colors.grey.shade100;
  static const Color _primaryColor = Color(0xff2D5895);
  static const Color _accentColor = Color(0xff00a7ff);
  static const Color _secondColor = Color(0xffE50831);
  static const Color _inactiveFieldColor = Color(0xFFB9BABB);
  static const Color _textPrimaryColor = Color(0xff2D5895);
  static const Color _textAccentColor = Color(0xffffffff);
  static const Color _lightOnPrimaryColor = _primaryColor;
  static const Color _textHintColor = Color(0xffffffff);

  static Color get textExtraColor => _textExtraColor;

  static const Color _textExtraColor = Color(0xff0681fc);

  static Color get scaffoldColor => _scaffoldColor;

  static final ThemeData appThemeLight = ThemeData(
      scaffoldBackgroundColor: _scaffoldColor,
      accentColor: _accentColor,
      fontFamily: 'ArbFONTS-DINNextLTArabic',
      primaryColor: _primaryColor,
      textTheme: TextTheme(
        title: primaryText(),
        caption: accentText(),
      ),
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          title: TextStyle(
              color: _textAccentColor,
              fontFamily: "ArbFONTS-DINNextLTArabic",
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
        color: _primaryColor,
        iconTheme: IconThemeData(color: _textAccentColor),
      ),
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        primaryVariant: _primaryColor,
        secondary: _secondColor,
        onPrimary: _lightOnPrimaryColor,
      ),
      iconTheme: IconThemeData(
        color: _primaryColor,
      ),
      dividerTheme: DividerThemeData(color: Colors.black12));

  static TextStyle primaryText({fontWeight, double fontSize, color}) =>
      TextStyle(
          color: color ?? _primaryColor,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.bold);
  static TextStyle linkText({fontWeight, double fontSize, color}) =>
      TextStyle(
          color: color ?? _primaryColor,
          fontSize: fontSize ?? 20,
          height: .8,
          decorationStyle: TextDecorationStyle.solid,
          decoration: TextDecoration.underline,
          fontWeight: fontWeight ?? FontWeight.bold);

  static TextStyle accentText({fontWeight, double fontSize, color}) =>
      TextStyle(
          color: color ?? _textAccentColor,
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.w600);

  static TextStyle descriptionText({fontWeight, double fontSize, color}) =>
      TextStyle(
          color: color ?? _primaryColor,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400);

  static Color get primaryColor => _primaryColor;

  static Color get accentColor => _accentColor;

  static Color get secondColor => _secondColor;

  static Color get textPrimaryColor => _textPrimaryColor;

  static Color get textAccentColor => _textAccentColor;

  static Color get inactiveFieldColor => _inactiveFieldColor;

  static Color get lightOnPrimaryColor => _lightOnPrimaryColor;

  static Color get textHintColor => _textHintColor;
}