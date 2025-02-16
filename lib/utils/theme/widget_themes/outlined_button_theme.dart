import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/sizes.dart';

class AppOutlineButtonTheme {
  
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.secondary,
      minimumSize: const Size(Sizes.buttonWidth, Sizes.buttonHeight),
      side: const BorderSide(color: AppColor.secondary, width: 2.5),
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.secondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.buttonRadius),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.secondary,
      minimumSize: const Size(Sizes.buttonWidth, Sizes.buttonHeight),
      side: const BorderSide(
        color: AppColor.secondary,
      ),
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.secondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.buttonRadius),
      ),
    ),
  );
}
