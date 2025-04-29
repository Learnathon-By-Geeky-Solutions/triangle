import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triangle/data/models/child/child_model.dart';
import 'package:triangle/data/repositories/child/child_repository.dart';
import 'package:triangle/utils/helpers/network_manager.dart';
import 'package:triangle/utils/popups/full_screen_loader.dart';
import 'package:triangle/utils/popups/loaders.dart';
import 'package:triangle/view/home/home_view.dart';
import '../../utils/formatters/formatter.dart';

class ChildOnboardingController extends GetxController {
  ChildOnboardingController({required this.repository});
  final ChildRepository repository;

  static ChildOnboardingController get instance => Get.find();
  final deviceStorage = GetStorage();

  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dobFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> statsFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final dobController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  

  Future<void> pickDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    
    if (picked != null) {
      dobController.text = Formatter.formatDate(picked);
    }
  }


  Future<void> saveChildData() async {
    try {
      FullScreenLoader.openLoadingDialog("Saving child data", "assets/animations/animated_circular_loader.json");

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }


      if (!statsFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      final newChild = ChildModel( 
        parentId: FirebaseAuth.instance.currentUser!.uid, 
        name: nameController.text.trim(), 
        dateOfBirth: DateTime.parse(dobController.text.trim()), 
        height: double.parse(heightController.text.trim()),
        weight: double.parse(weightController.text.trim()),
      );


      final childId = await repository.saveChild(newChild);

      deviceStorage.write("childId", childId);
    
      FullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(title: "Success", message: "Child data saved successfully");

      Get.offAll(() => const HomeView()); 
    } catch (e) {
      FullScreenLoader.stopLoading();

      AppLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}