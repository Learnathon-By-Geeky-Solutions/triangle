import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ChildDobInputView extends StatelessWidget {
  const ChildDobInputView({super.key});

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
                'Enter Your Child\'s Birthday',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your child's date of birth",
                ),
                keyboardType: TextInputType.datetime,
                
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