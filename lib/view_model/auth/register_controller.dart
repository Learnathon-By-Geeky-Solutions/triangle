import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/data/models/user/user_model.dart';
import 'package:triangle/data/repositories/user/user_repository_impl.dart';
import 'package:triangle/utils/helpers/network_manager.dart';
import 'package:triangle/utils/popups/loaders.dart';
import 'package:triangle/view/home/home_view.dart';

import '../../data/repositories/auth/authentication_repository_impl.dart';
import '../../data/repositories/user/user_repository.dart';
import '../../utils/popups/full_screen_loader.dart';

class RegisterController extends GetxController {
  RegisterController({required this.repository});

  final UserRepository repository;

  static RegisterController get instance => Get.find();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var passwordVisible = false.obs;
  var termsAndConditions = false.obs;

  void register() async {
    try {
      FullScreenLoader.openLoadingDialog("Processing your information", "assets/animations/animated_circular_loader.json");

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        
        FullScreenLoader.stopLoading();
        return;
      }

      if (!registerFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!termsAndConditions.value) {
        AppLoaders.warningSnackBar(title: "Terms and Conditions", message: "Please accept the terms and conditions");
        FullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepositoryImpl.instance.registerWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );


      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: emailController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        profilePicture: "",
      );


      final userRepository = Get.put(UserRepositoryImpl());
      await userRepository.saveUserData(newUser);

      FullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(title: "Congratulations", message: "Account created successfully");

      Get.offAll(() => const HomeView());

    }
    catch (e) {
      FullScreenLoader.stopLoading();

      AppLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

}