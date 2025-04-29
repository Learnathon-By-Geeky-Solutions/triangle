import 'package:get/get.dart';
import 'package:triangle/data/repositories/auth/authentication_repository.dart';
import 'package:triangle/data/repositories/auth/authentication_repository_impl.dart';
import 'package:triangle/data/repositories/child/child_repository.dart';
import 'package:triangle/data/repositories/child/child_repository_impl.dart';
import 'package:triangle/data/repositories/user/user_repository.dart';
import 'package:triangle/utils/helpers/network_manager.dart';
import 'package:triangle/view_model/auth/initial_screen_redirect.dart';
import 'package:triangle/view_model/auth/login_controller.dart';
import 'package:triangle/view_model/auth/register_controller.dart';
import 'package:triangle/view_model/child/child_controller.dart';
import 'package:triangle/view_model/child_onboarding/child_onboarding_controller.dart';
import 'package:triangle/view_model/home/home_controller.dart';

import '../data/repositories/user/user_repository_impl.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InitialScreenRedirect());
    Get.lazyPut(() => NetworkManager());

    // Repository bindings
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImpl());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(authRepository: Get.find<AuthenticationRepository>()));
    Get.lazyPut<ChildRepository>(() => ChildRepositoryImpl(userRepository: Get.find<UserRepository>()));

    // Controller bindings
    Get.lazyPut<RegisterController>(() => RegisterController(authRepository: Get.find<AuthenticationRepository>(), userRepository: Get.find<UserRepository>()));
    Get.lazyPut<LoginController>(() => LoginController(repository: Get.find<AuthenticationRepository>()));
    Get.lazyPut<ChildOnboardingController>(() => ChildOnboardingController(repository: Get.find<ChildRepository>()));
    Get.lazyPut<ChildController>(() => ChildController(repository: Get.find<ChildRepository>()));
    Get.lazyPut<HomeController>(() => HomeController(childController: Get.find<ChildController>()));
  }
}