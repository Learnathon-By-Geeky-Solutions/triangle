import 'package:flutter_test/flutter_test.dart';
import 'package:triangle/utils/exceptions/app_exceptions.dart';

void main() {
  group('AppBaseException', () {
    test('returns correct message for known error codes', () {
      expect(AppFirebaseAuthException('email-already-in-use').message,
          'The email address is already registered. Please use a different email.');
      expect(AppFirebaseAuthException('invalid-email').message,
          'The email address provided is invalid. Please enter a valid email.');
      expect(AppFirebaseAuthException('unknown').message,
          'An unknown Firebase error occurred. Please try again.');
      expect(AppFirebaseAuthException('unrecognized-code').message,
          'An unexpected error occurred. Please try again.');
      expect(AppFirebaseAuthException('weak-password').message,
          'The password is too weak. Please choose a stronger password.');
      expect(AppFirebaseAuthException('user-disabled').message,
          'This user account has been disabled. Please contact support for assistance.');
      expect(AppFirebaseAuthException('wrong-password').message,
          'Incorrect password. Please check your password and try again.');
      expect(AppFirebaseAuthException('user-not-found').message,
          'Invalid login details. User not found.');
    });

    test('AppFirebaseAuthException returns correct message', () {
      expect(AppFirebaseAuthException('credential-already-in-use').message,
          'This credential is already associated with a different user account.');
      expect(AppFirebaseAuthException('user-mismatch').message,
          'The supplied credentials do not correspond to the previously signed-in user.');
      expect(AppFirebaseAuthException('account-exists-with-different-credential').message,
          'An account already exists with the same email but different sign-in credentials.');
      expect(AppFirebaseAuthException('requires-recent-login').message,
          'This operation is sensitive and requires recent authentication. Please log in again.');
    });

    test('AppFirebaseException returns correct message', () {
      expect(AppFirebaseException('invalid-verification-code').message,
          'Invalid verification code. Please enter a valid code.');
      expect(AppFirebaseException('invalid-verification-id').message,
          'Invalid verification ID. Please request a new verification code.');
      expect(AppFirebaseException('quota-exceeded').message,
          'Quota exceeded. Please try again later.');
    });

    test('AppPlatformException returns correct message', () {
      expect(AppPlatformException('app-not-authorized').message,
          'The app is not authorized to use Firebase Authentication with the provided API key.');
      expect(AppPlatformException('internal-error').message,
          'An internal authentication error occurred. Please try again later.');
      expect(AppPlatformException('invalid-app-credential').message,
          'The app credential is invalid. Please provide a valid app credential.');
      expect(AppPlatformException('invalid-cordova-configuration').message,
          'The provided Cordova configuration is invalid.');
      expect(AppPlatformException('app-deleted').message,
          'This instance of FirebaseApp has been deleted.');
      expect(AppPlatformException('user-token-mismatch').message,
          'The provided user\'s token has a mismatch with the authenticated user\'s user ID.');
      expect(AppPlatformException('web-storage-unsupported').message,
          'Web storage is not supported or is disabled.');
      expect(AppPlatformException('keychain-error').message,
          'A keychain error occurred. Please check the keychain and try again.');
    });

  });
}
