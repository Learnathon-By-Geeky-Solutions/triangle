import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/sizes.dart';

class AppFilledButtonTheme {
  
  static final lightfilledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColor.primary,
      // foregroundColor: AppColor.light,
      disabledBackgroundColor: AppColor.darkGrey,
      // disabledForegroundColor: AppColor.darkGrey,
      side: const BorderSide(color: AppColor.primary),
      minimumSize: const Size(Sizes.buttonWidth, Sizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.buttonRadius)),
  ));

  static final darkfilledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.light,
      disabledBackgroundColor: AppColor.darkGrey,
      // disabledForegroundColor: AppColor.darkGrey,
      side: const BorderSide(color: AppColor.primary),
      minimumSize: const Size(Sizes.buttonWidth, Sizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.buttonRadius),
      )
    )
  );
}
