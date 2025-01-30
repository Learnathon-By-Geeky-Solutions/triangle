import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {

    var isPassField = isPasswordField.obs;
    var passwordVisibility = (!isPassField.value).obs;

    return Obx(() =>
      TextFormField(
        controller: controller,
        obscureText: !passwordVisibility.value,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.textDarkGray
          ),
          filled: true,
          fillColor: AppColor.surface,
          suffixIcon: isPassField.value 
            ? IconButton(
              icon: Icon(passwordVisibility.value ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill, 
              size: 18,), onPressed: () { passwordVisibility.value = !passwordVisibility.value; },
            ) 
            : null,  
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: AppColor.border,
                width: 2
              )
          ),
        ),
      ),
    );
  }
}

