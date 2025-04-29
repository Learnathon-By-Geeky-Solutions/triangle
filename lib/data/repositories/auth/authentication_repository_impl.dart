import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triangle/data/repositories/auth/authentication_repository.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';

import '../../../utils/exceptions/app_exceptions.dart';
import '../../../view/auth/login_view.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth;

  AuthenticationRepositoryImpl({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance;
  
  final deviceStorage = GetStorage();
  static const commonErrorMessage = "An unexpected error occurred. Please try again.";

  @override
  User? get currentUser => _auth.currentUser;
  
  @override
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw commonErrorMessage;
    }
  }


  @override
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw commonErrorMessage;
    }
  }


  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginView());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw commonErrorMessage;
    }
  }
}