import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/colors/app_colors.dart';

class CustomCheckbox extends StatelessWidget {

  final bool isChecked;
  final String text;

  const CustomCheckbox({
    super.key, 
    this.isChecked = false, 
    required this.text});

  @override
  Widget build(BuildContext context) {

    var isChck = isChecked.obs;

    return Row(
      children: [
        Obx(() =>
          Checkbox(
            value: isChck.value,
            onChanged: (value) { isChck.value = value!; },
            activeColor: AppColor.success,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Text(text),
      ],
    );
  }
}