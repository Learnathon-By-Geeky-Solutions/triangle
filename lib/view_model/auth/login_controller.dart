import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repositories/auth/authentication_repository.dart';
import '../../utils/helpers/network_manager.dart';
import '../../utils/popups/full_screen_loader.dart';
import '../../utils/popups/loaders.dart';
import '../../view/home/home_view.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final deviceStorage = GetStorage();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var passwordVisible = false.obs;
  var rememberMe = false.obs;


  @override
  void onInit() {
    emailController.text = deviceStorage.read("REMEMBER_ME_EMAIL") ?? "";
    passwordController.text = deviceStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  void login() async {
    try {
      FullScreenLoader.openLoadingDialog("Logging in", "assets/animations/animated_circular_loader.json");

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        deviceStorage.write("REMEMBER_ME_EMAIL", emailController.text.trim());
        deviceStorage.write("REMEMBER_ME_PASSWORD", passwordController.text.trim());
      }
      
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      FullScreenLoader.stopLoading();

      Get.offAll(() => const HomeView());

    } catch (e) {
      FullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: "Login Error", message: e.toString());
    }
  }

  void forgotPassword() {
    // Implement forgot password logic here
  }

}