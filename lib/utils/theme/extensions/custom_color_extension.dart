import 'package:flutter/material.dart';

class CustomColorExtension extends ThemeExtension<CustomColorExtension> {
  
  final Color customPrimaryColor;

  CustomColorExtension({required this.customPrimaryColor});
  
  @override
  ThemeExtension<CustomColorExtension> copyWith({Color? customPrimaryColor}) {
    return CustomColorExtension(customPrimaryColor: customPrimaryColor ?? this.customPrimaryColor);
  }

  @override
  ThemeExtension<CustomColorExtension> lerp(covariant ThemeExtension<CustomColorExtension>? other, double t) {
    if (other is! CustomColorExtension) return this;
    return CustomColorExtension(customPrimaryColor: Color.lerp(customPrimaryColor, other.customPrimaryColor, t)!);
  }
}