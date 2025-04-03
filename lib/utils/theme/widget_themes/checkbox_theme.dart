import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

/// Custom Class for Light & Dark Checkbox Themes
class AppCheckboxTheme {


  /// Customizable Light Checkbox Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: const CircleBorder(),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.white;
      } else {
        return AppColor.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.success;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Checkbox Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: const CircleBorder(),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.white;
      } else {
        return AppColor.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.success;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
