import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:triangle/data/models/user/user_model.dart';

import '../../../utils/exceptions/app_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> saveUserData(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw "An unexpected error occurred. Please try again.";
    }
  }
}