import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/app_colors.dart';

import '../../utils/constants/sizes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Sizes.lg),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      Image(image: AssetImage("assets/images/app_logo.png")),
                    ],
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  Form(
                    child: Column(children: [
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(height: Sizes.spaceBtwInputFields),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Password",
                          suffixIcon: Icon(CupertinoIcons.eye_slash),
                        ),
                      ),
                      // const SizedBox(height: Sizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text("Remember me")
                          ]),
                      
                          TextButton(onPressed: () {}, child: const Text("Forgot Password?", style: TextStyle(color: AppColor.secondary, fontWeight: FontWeight.w600),))
                        ],
                      ),
                      
                      const SizedBox(height: Sizes.spaceBtwSections),
                      
                      FilledButton(onPressed: () {}, child: const Text("Login")),
                      
                      const SizedBox(height: Sizes.spaceBtwSections),
                      
                      const Text("Don't have an account?", style: TextStyle(color: AppColor.textSecondary),),
                      const SizedBox(height: Sizes.spaceBtwItems),
                      OutlinedButton(onPressed: () {}, child: const Text("Register"))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}