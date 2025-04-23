import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/view/home/home_view.dart';
import '../../utils/constants/sizes.dart';
import '../../view_model/child_onboarding/child_onboarding_controller.dart';

class ChildStatsInputView extends StatelessWidget {
  ChildStatsInputView({super.key});
  
  final controller = ChildOnboardingController.instance;

  @override
  Widget build(BuildContext context) {
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
                'Enter Child\'s Height & Weight',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              // Height Input
              TextFormField(
                controller: controller.heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter height in centimeters',
                  suffixText: 'cm',
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              // Weight Input
              TextFormField(
                controller: controller.weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter weight in kilograms',
                  suffixText: 'kg',
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              // Continue Button
              OutlinedButton(
                onPressed: () {
                  Get.to(() => const HomeView());
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