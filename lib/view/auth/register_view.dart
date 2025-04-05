import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/theme/extentions/custom_color_extention.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/validator/app_validator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    var passwordVisible = false.obs;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.lg),
        child: Form(
          key: formKey,
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
                          fontSize: Sizes.fontSizeLg),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Name"),
                      controller: nameController,
                      validator: (value) => AppValidator.validateName(value),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Email address"),
                      controller: emailController,
                      validator: (value) => AppValidator.validateEmail(value),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Mobile number"),
                      controller: phoneController,
                      validator: (value) =>
                          AppValidator.validatePhoneNumber(value),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    Obx(() =>
                      TextFormField(
                        obscureText: !passwordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible.value
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash,
                              ),
                              onPressed: () {
                                passwordVisible.value = !passwordVisible.value;
                              },
                            )),
                        controller: passwordController,
                        validator: (value) =>
                            AppValidator.validatePassword(value),
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    Obx(() =>
                      TextFormField(
                        obscureText: !passwordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Confirm password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible.value
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash,
                              ),
                              onPressed: () {
                                passwordVisible.value = !passwordVisible.value;
                              },
                            )),
                        controller: confirmPasswordController,
                        validator: (value) =>
                            AppValidator.validateConfirmPassword(passwordController.text, value),
                      ),
                    ),
                    Row(children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text("termsAndConditions".tr)
                    ]),
                    const SizedBox(height: Sizes.spaceBtwSections),
                  ],
                ),
                Column(
                  children: [
                    FilledButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            Get.snackbar("Success", "Validated");
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context)
                                  .extension<CustomColorExtention>()
                                  ?.customPrimaryColor),
                        ),
                        child: const Text("Register")),
                    const SizedBox(height: Sizes.spaceBtwSections),
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: AppColor.textSecondary),
                    ),
                    const SizedBox(height: Sizes.spaceBtwItems),
                    OutlinedButton(onPressed: () {}, child: const Text("Login"))
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
