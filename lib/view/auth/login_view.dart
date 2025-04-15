import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/validators/app_validator.dart';
import '../../view_model/auth/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());

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
              key: controller.loginFormKey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  controller: controller.emailController,
                  validator: (value) => AppValidator.validateEmail(value),
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                Obx(() =>
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                         controller.passwordVisible.value ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash,
                        ),
                        onPressed: () {
                          controller.passwordVisible.value = !controller.passwordVisible.value;
                        },
                      ),
                    ),
                    controller: controller.passwordController,
                    obscureText: !controller.passwordVisible.value,
                    validator: (value) => AppValidator.validatePassword(value),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(height: 24, width: 24, child: Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) { 
                        controller.rememberMe.value = value ?? false;
                      }))),
                      const Text(" Remember me")
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
                    controller.login();
                  },
                  child: const Text("Login"),
                ),

                const SizedBox(height: Sizes.spaceBtwSections),

                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: AppColor.textSecondary),
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                OutlinedButton(onPressed: () {}, child: const Text("Register")),
                const SizedBox(height: Sizes.spaceBtwSections),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
