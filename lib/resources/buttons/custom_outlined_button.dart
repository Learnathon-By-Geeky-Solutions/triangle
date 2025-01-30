import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color outlineColor;
  final Color textColor;


  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.outlineColor = AppColor.secondary,
    this.textColor = AppColor.secondary
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColor.primary,
      child: Container(
        height: 50,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: outlineColor, width: 2),
        ),
        child: Text(text,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
