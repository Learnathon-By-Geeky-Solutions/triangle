import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/theme/extensions/custom_color_extension.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/validators/app_validator.dart';
import '../../view_model/auth/register_controller.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.lg),
        child: Form(
          key: controller.registerFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: Sizes.imageThumbSize,
                    ),
                    const Text(
                      "Create account as a parent",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.fs18),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(hintText: "First Name"),
                            controller: controller.firstNameController,
                            validator: (value) => AppValidator.validateName(value),
                          ),
                        ),
                        const SizedBox(width: Sizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(hintText: "Last Name"),
                            controller: controller.lastNameController,
                            validator: (value) => AppValidator.validateName(value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Email address"),
                      controller: controller.emailController,
                      validator: (value) => AppValidator.validateEmail(value),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Mobile number"),
                      controller: controller.phoneController,
                      validator: (value) =>
                          AppValidator.validatePhoneNumber(value),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    Obx(() =>
                      TextFormField(
                        obscureText: !controller.passwordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.passwordVisible.value
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash,
                              ),
                              onPressed: () {
                                controller.passwordVisible.value = !controller.passwordVisible.value;
                              },
                            )),
                        controller: controller.passwordController,
                        validator: (value) =>
                            AppValidator.validatePassword(value),
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    Obx(() =>
                      TextFormField(
                        obscureText: !controller.passwordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Confirm password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.passwordVisible.value
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash,
                              ),
                              onPressed: () {
                                controller.passwordVisible.value = !controller.passwordVisible.value;
                              },
                            )),
                        controller: controller.confirmPasswordController,
                        validator: (value) =>
                            AppValidator.validateConfirmPassword(controller.passwordController.text, value),
                      ),
                    ),
                    const SizedBox(height: Sizes.spaceBtwInputFields),
                    Row(
                      children: [
                        SizedBox(
                          height: 24, 
                          width: 24, 
                          child: Obx(() => Checkbox(
                            value: controller.termsAndConditions.value, 
                            onChanged: (value) {
                              controller.termsAndConditions.value = value!;
                            }
                          )),
                        ),
                        const SizedBox(width: Sizes.spaceBtwItems),
                        GestureDetector(
                          onTap: () {
                            controller.termsAndConditions.value = !controller.termsAndConditions.value;
                          },
                          child: Text("termsAndConditions".tr),
                        )
                      ]
                    ),
                    const SizedBox(height: Sizes.spaceBtwSections),
                  ],
                ),
                Column(
                  children: [
                    FilledButton(
                        onPressed: () {
                          controller.register();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context)
                                  .extension<CustomColorExtension>()
                                  ?.customPrimaryColor),
                        ),
                        child: const Text("Register")),
                    const SizedBox(height: Sizes.spaceBtwSections),
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: AppColor.textSecondary),
                    ),
                    const SizedBox(height: Sizes.spaceBtwItems),
                    OutlinedButton(
                      onPressed: () => Get.to(() => const LoginView()),
                      child: const Text("Login"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
