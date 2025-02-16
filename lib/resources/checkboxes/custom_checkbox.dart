import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';

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
          SizedBox(
            width: 48,
            height: 48,
            child: Checkbox(
              value: isChck.value,
              onChanged: (value) { isChck.value = value!; },
              activeColor: AppColor.success,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              semanticLabel: text,
            ),
          ),
        ),
        Semantics(
          label: text,
          child: Text(text),
        ),
      ],
    );
  }
}