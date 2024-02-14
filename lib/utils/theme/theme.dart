import 'package:flutter/material.dart';
import 'package:time_namaz/utils/constants/color.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: TColors.lightColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: TColors.containerColorBlue)
  );

  static ThemeData darktTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: TColors.darkColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: TColors.containerColorBlue),
  );
}
