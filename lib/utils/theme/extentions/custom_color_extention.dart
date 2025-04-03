import 'package:flutter/material.dart';

class CustomColorExtention extends ThemeExtension<CustomColorExtention> {
  
  final Color customPrimaryColor;

  CustomColorExtention({required this.customPrimaryColor});
  
  @override
  ThemeExtension<CustomColorExtention> copyWith({Color? customPrimaryColor}) {
    return CustomColorExtention(customPrimaryColor: customPrimaryColor ?? this.customPrimaryColor);
  }

  @override
  ThemeExtension<CustomColorExtention> lerp(covariant ThemeExtension<CustomColorExtention>? other, double t) {
    if (other is! CustomColorExtention) return this;
    return CustomColorExtention(customPrimaryColor: Color.lerp(customPrimaryColor, other.customPrimaryColor, t)!);
  }
}