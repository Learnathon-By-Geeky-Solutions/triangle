import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/app_colors.dart';

class AppBottomNavigationBarTheme {
  static const BottomNavigationBarThemeData lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColor.softGrey,
    selectedItemColor: AppColor.secondary,
    unselectedItemColor: AppColor.black,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    enableFeedback: true,
  );

  static const BottomNavigationBarThemeData darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColor.darkerGrey,
    selectedItemColor: AppColor.secondary,
    unselectedItemColor: AppColor.white,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    enableFeedback: true,
  );
}