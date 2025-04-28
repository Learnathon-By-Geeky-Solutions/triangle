import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triangle/data/repositories/auth/authentication_repository.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';
import 'package:triangle/view/child_onboarding/child_name_input_view.dart';

import '../../../utils/exceptions/app_exceptions.dart';
import '../../../view/auth/login_view.dart';
import '../../../view/auth/register_view.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  static AuthenticationRepositoryImpl get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  
  @override
  Future<void> onReady() async {
    FlutterNativeSplash.remove();
    await screenRedirect();
  }

  @override
  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
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
      throw "An unexpected error occurred. Please try again.";
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
      throw "An unexpected error occurred. Please try again.";
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
      throw "An unexpected error occurred. Please try again.";
    }
  }
}