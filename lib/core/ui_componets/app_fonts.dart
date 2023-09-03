import 'package:flutter/material.dart';
import 'package:test_project/core/ui_componets/app_colors.dart';

abstract class AppFonts {
  static const TextStyle w500s15 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.33,
    fontFamily: 'Manrope',
  );
  static const TextStyle placeHolderTextStyle = TextStyle(
    color: Color(0xFFC2C2C2),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Manrope',
  );
  static const TextStyle titleText = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
    height: 1.67,
  );
  static const TextStyle subtitleText = TextStyle(
    color: Color(0xFF919191),
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textButton = TextStyle(
    color: Color(0xFFEC3A4D),
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );
}
