import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/sizes.dart';
import '../../view_model/child_onboarding/child_onboarding_controller.dart';

class ChildDobInputView extends StatefulWidget {
  const ChildDobInputView({super.key});

  @override
  State<ChildDobInputView> createState() => _ChildDobInputViewState();
}

class _ChildDobInputViewState extends State<ChildDobInputView> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.find<ChildOnboardingController>();

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Child\'s Birthday',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              
              TextFormField(
                controller: controller.dobController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "Select your child's date of birth",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => controller.pickDate(context),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              OutlinedButton(
                onPressed: () {
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