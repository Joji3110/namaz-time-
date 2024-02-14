import 'package:flutter/material.dart';
import 'package:time_namaz/utils/constants/color.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      labelLarge: const TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: TColors.darkColor,
  ));

  static TextTheme darkTextTheme = TextTheme(
      labelLarge: const TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: TColors.lightColor,
  ));
}
