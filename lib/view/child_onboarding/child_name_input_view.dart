import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/sizes.dart';
import '../../view_model/child_onboarding/child_onboarding_controller.dart';
import 'child_dob_input_view.dart';

class ChildNameInputView extends StatelessWidget {
  const ChildNameInputView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ChildOnboardingController());

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
                'Welcome to LittleSteps',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              Image.asset("assets/images/lying_baby.png"),
              const SizedBox(height: Sizes.spaceBtwItems),
              TextFormField(
                decoration: const InputDecoration(hintText: "Enter your child's name"),
                controller: controller.nameController,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              OutlinedButton(onPressed: () => Get.to(() => const ChildDobInputView()), child: const Text("Continue")),
            ],
          ),
        ),
      ),
    );
  }
}