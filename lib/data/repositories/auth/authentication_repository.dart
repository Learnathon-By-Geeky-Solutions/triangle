import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  User? get currentUser;
  Future<UserCredential> loginWithEmailAndPassword(String email, String password);
  Future<UserCredential> registerWithEmailAndPassword(String email, String password);
  Future<void> logout();
}