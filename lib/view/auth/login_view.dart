import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/validator/app_validator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(Sizes.lg),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: Sizes.imageThumbSize),
            const Column(
              children: [
                Image(image: AssetImage("assets/images/app_logo.png")),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),
            Form(
              key: formKey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) => AppValidator.validateEmail(value),
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(CupertinoIcons.eye_slash),
                  ),
                  validator: (value) => AppValidator.validatePassword(value),
                ),
                // const SizedBox(height: Sizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text("Remember me")
                    ]),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: AppColor.secondary,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
        
                const SizedBox(height: Sizes.spaceBtwSections),
        
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Get.snackbar("Success", "Validated");
                    }
                  },
                  child: const Text("Login"),
                ),
        
                const SizedBox(height: Sizes.spaceBtwSections),
        
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: AppColor.textSecondary),
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                OutlinedButton(
                    onPressed: () {}, child: const Text("Register")),
                const SizedBox(height: Sizes.spaceBtwSections),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
