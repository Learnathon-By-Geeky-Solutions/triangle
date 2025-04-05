import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/app_colors.dart';

import '../../constants/sizes.dart';

class AppTextFormFieldTheme {

  static InputDecorationTheme lightInputDecorationTheme =  InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: AppColor.darkGrey,
    hintStyle: const TextStyle().copyWith(fontSize: Sizes.fontSizeMd, color: AppColor.textSecondary),
    filled: true,
    fillColor: AppColor.surface,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: BorderSide.none
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: AppColor.border,
        width: 2,
      )
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: AppColor.error,
        width: 2,
      )
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: AppColor.error,
        width: 2,
      )
    )
  );


  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: AppColor.darkGrey,
    hintStyle: const TextStyle().copyWith(fontSize: Sizes.fontSizeMd, color: AppColor.textSecondary),
    filled: true,
    fillColor: AppColor.surfaceDark,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: BorderSide.none
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: AppColor.border,
        width: 2,
      )
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: AppColor.error,
        width: 2,
      )
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: AppColor.error,
        width: 2,
      )
    )
  );
}