import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ChildNameInputView extends StatelessWidget {
  const ChildNameInputView({super.key});

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
                'Welcome to LitteSteps',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              Image.asset("assets/images/lying_baby.png"),
              const SizedBox(height: Sizes.spaceBtwItems),
              TextFormField(
                decoration: const InputDecoration(hintText: "Enter your child's name"),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              OutlinedButton(onPressed: () {}, child: const Text("Continue")),
            ],
          ),
        ),
      ),
    );
  }
}