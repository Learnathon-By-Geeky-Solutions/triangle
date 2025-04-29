import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:triangle/data/models/user/user_model.dart';
import 'package:triangle/data/repositories/auth/authentication_repository.dart';
import 'package:triangle/data/repositories/user/user_repository.dart';
import 'package:triangle/utils/exceptions/app_exceptions.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';

class UserRepositoryImpl extends UserRepository {
  final AuthenticationRepository _authRepository;
  final FirebaseFirestore _firestore;

  UserRepositoryImpl({
    required AuthenticationRepository authRepository,
    FirebaseFirestore? firestore,
  }) : _authRepository = authRepository, 
       _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  String? get userId => _authRepository.currentUser?.uid;

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

  @override
  Future<UserModel?> getUserData() async {
    try {
      final docSnapshot = await _firestore
          .collection("users")
          .doc(userId)
          .get();

      if (docSnapshot.exists) {
        return UserModel.fromSnapshot(docSnapshot);
      } else {
        return UserModel.empty();
      }
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