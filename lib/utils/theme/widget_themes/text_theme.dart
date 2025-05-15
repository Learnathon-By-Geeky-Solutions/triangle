import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/sizes.dart';
import 'package:triangle/utils/constants/app_colors.dart';

class AppTextTheme {

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: Sizes.rfs32, fontWeight: FontWeight.bold, color: AppColor.dark),
    headlineMedium: const TextStyle().copyWith(fontSize: Sizes.rfs24, fontWeight: FontWeight.w600, color: AppColor.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: Sizes.rfs18, fontWeight: FontWeight.w600, color: AppColor.dark),

    titleLarge: const TextStyle().copyWith(fontSize: Sizes.rfs16, fontWeight: FontWeight.w600, color: AppColor.dark),
    titleMedium: const TextStyle().copyWith(fontSize: Sizes.rfs16, fontWeight: FontWeight.w500, color: AppColor.dark),
    titleSmall: const TextStyle().copyWith(fontSize: Sizes.rfs16, fontWeight: FontWeight.w400, color: AppColor.dark),

    bodyLarge: const TextStyle().copyWith(fontSize: Sizes.rfs14, fontWeight: FontWeight.w500, color: AppColor.dark),
    bodyMedium: const TextStyle().copyWith(fontSize: Sizes.rfs14, fontWeight: FontWeight.normal, color: AppColor.dark),
    bodySmall: const TextStyle().copyWith(fontSize: Sizes.rfs12, fontWeight: FontWeight.w400, color: AppColor.dark),

    labelLarge: const TextStyle().copyWith(fontSize: Sizes.rfs12, fontWeight: FontWeight.normal, color: AppColor.dark),
    labelMedium: const TextStyle().copyWith(fontSize: Sizes.rfs12, fontWeight: FontWeight.normal, color: AppColor.dark),
    labelSmall: const TextStyle().copyWith(fontSize: Sizes.rfs10, fontWeight: FontWeight.normal,  color: AppColor.dark.withValues(alpha: 0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: Sizes.rfs32, fontWeight: FontWeight.bold, color: AppColor.light),
    headlineMedium: const TextStyle().copyWith(fontSize: Sizes.rfs24, fontWeight: FontWeight.w600, color: AppColor.light),
    headlineSmall: const TextStyle().copyWith(fontSize: Sizes.rfs18, fontWeight: FontWeight.w600, color: AppColor.light),

    titleLarge: const TextStyle().copyWith(fontSize: Sizes.rfs16, fontWeight: FontWeight.w600, color: AppColor.light),
    titleMedium: const TextStyle().copyWith(fontSize: Sizes.rfs16, fontWeight: FontWeight.w500, color: AppColor.light),
    titleSmall: const TextStyle().copyWith(fontSize: Sizes.rfs16, fontWeight: FontWeight.w400, color: AppColor.light),

    bodyLarge: const TextStyle().copyWith(fontSize: Sizes.rfs14, fontWeight: FontWeight.w500, color: AppColor.light),
    bodyMedium: const TextStyle().copyWith(fontSize: Sizes.rfs14, fontWeight: FontWeight.normal, color: AppColor.light),
    bodySmall: const TextStyle().copyWith(fontSize: Sizes.rfs12, fontWeight: FontWeight.w400, color: AppColor.light),

    labelLarge: const TextStyle().copyWith(fontSize: Sizes.rfs12, fontWeight: FontWeight.normal, color: AppColor.light),
    labelMedium: const TextStyle().copyWith(fontSize: Sizes.rfs12, fontWeight: FontWeight.normal, color: AppColor.light.withValues(alpha: 0.5)),
    labelSmall: const TextStyle().copyWith(fontSize: Sizes.rfs10, fontWeight: FontWeight.normal, color: AppColor.light.withValues(alpha: 0.5)),
  );
}