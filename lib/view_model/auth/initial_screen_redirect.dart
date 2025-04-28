import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triangle/view/auth/login_view.dart';
import 'package:triangle/view/auth/register_view.dart';
import 'package:triangle/view/child_onboarding/child_name_input_view.dart';

class InitialScreenRedirect extends GetxController {
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAll(() => const ChildNameInputView());
    }
    else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const RegisterView())
          : Get.offAll(() => const LoginView());
    }
  }
}