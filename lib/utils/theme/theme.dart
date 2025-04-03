import 'package:flutter/material.dart';
import 'package:triangle/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:triangle/utils/theme/widget_themes/filled_button_theme.dart';
import 'package:triangle/utils/theme/widget_themes/text_field_theme.dart';
import 'package:triangle/utils/theme/widget_themes/text_theme.dart';

import '../constants/app_colors.dart';
import 'extentions/custom_color_extention.dart';
import 'widget_themes/outlined_button_theme.dart';

class AppTheme {
  
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    disabledColor: AppColor.grey,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    filledButtonTheme: AppFilledButtonTheme.lightfilledButtonTheme,
    outlinedButtonTheme: AppOutlineButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,

    extensions: [
      CustomColorExtention(customPrimaryColor: AppColor.primary),
    ]
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    disabledColor: AppColor.grey,
    textTheme: AppTextTheme.darkTextTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
    filledButtonTheme: AppFilledButtonTheme.darkfilledButtonTheme,
    outlinedButtonTheme: AppOutlineButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,

    extensions: [
      CustomColorExtention(customPrimaryColor: AppColor.primaryBright),
    ]
  );
}