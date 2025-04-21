import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/formatters/formatter.dart';

class ChildOnboardingController extends GetxController {
  static ChildOnboardingController get instance => Get.find();

  final TextEditingController nameController = TextEditingController();
  final dobController = TextEditingController();
  final selectedDate = Rx<DateTime?>(null);

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dobController.text = Formatter.formatDate(picked); 
    }
  }
}