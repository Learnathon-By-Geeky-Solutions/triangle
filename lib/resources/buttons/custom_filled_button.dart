import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color buttonColor;
  final Color textColor;


  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColor.primary,
    this.textColor = AppColor.textWhite
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: buttonColor
      ),
      child: Text(text,
        style: TextStyle(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
