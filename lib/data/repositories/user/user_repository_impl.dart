import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:triangle/data/models/user/user_model.dart';
import 'package:triangle/data/repositories/user/user_repository.dart';
import 'package:triangle/utils/exceptions/app_exceptions.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';

class UserRepositoryImpl extends UserRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<String> saveUserData(UserModel user) async {
    try {
      final docRef = _firestore.collection("users").doc(user.id);
      await docRef.set(user.toJson());

      return docRef.id;
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