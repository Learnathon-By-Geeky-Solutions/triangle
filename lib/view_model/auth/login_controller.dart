import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triangle/data/repositories/auth/authentication_repository.dart';

import '../../data/repositories/auth/authentication_repository_impl.dart';
import '../../utils/helpers/network_manager.dart';
import '../../utils/popups/full_screen_loader.dart';
import '../../utils/popups/loaders.dart';
import '../../view/home/home_view.dart';

class LoginController extends GetxController {
  LoginController({required this.repository});
  
  final AuthenticationRepository repository;

  static LoginController get instance => Get.find();

  final deviceStorage = GetStorage();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var passwordVisible = false.obs;
  var rememberMe = false.obs;
  


  @override
  void onInit() {
    super.onInit();
    emailController.text = deviceStorage.read("REMEMBER_ME_EMAIL") ?? "";
    passwordController.text = deviceStorage.read("REMEMBER_ME_PASSWORD") ?? "";
  }

  void login() async {
    try {
      FullScreenLoader.openLoadingDialog("Logging in", "assets/animations/animated_circular_loader.json");

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        AppLoaders.errorSnackBar(title: "No Internet", message: "Please check your internet connection.");
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
      
      await repository.loginWithEmailAndPassword(
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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordVisible.close();
    rememberMe.close();
    super.onClose();
  }

}