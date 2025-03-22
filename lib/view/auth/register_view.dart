import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../utils/constants/app_colors.dart';
import '../../utils/constants/sizes.dart';



class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.lg),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Sizes.imageThumbSize,),
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
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Email address"),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Mobile number"),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          suffixIcon: Icon(CupertinoIcons.eye_slash)),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Confirm password",
                          suffixIcon: Icon(CupertinoIcons.eye_slash)),
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
                        onPressed: () {}, child: const Text("Register")),
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