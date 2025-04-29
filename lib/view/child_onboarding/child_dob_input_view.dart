import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/validators/app_validator.dart';

import '../../utils/constants/sizes.dart';
import '../../view_model/child_onboarding/child_onboarding_controller.dart';
import 'child_stats_input_view.dart';

class ChildDobInputView extends StatefulWidget {
  const ChildDobInputView({super.key});

  @override
  State<ChildDobInputView> createState() => _ChildDobInputViewState();
}

class _ChildDobInputViewState extends State<ChildDobInputView> {
  final controller = Get.find<ChildOnboardingController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(padding: const EdgeInsets.all(Sizes.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter Your Child\'s Birthday',
                style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: Sizes.spaceBtwItems),
              
              Form(
                key: controller.dobFormKey,
                child: TextFormField(
                  controller: controller.dobController,
                  // readOnly: true,
                  decoration: const InputDecoration(
                    hintText: "Select your child's date of birth",
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async => controller.pickDate(context),
                  validator: (date) { 
                    AppValidator.validateDate(date);
                    return null;
                  },
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              OutlinedButton(
                onPressed: () {
                  if (controller.dobFormKey.currentState!.validate()) {
                    controller.dobFormKey.currentState!.save();
                    Get.to(() => ChildStatsInputView());
                  }
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}