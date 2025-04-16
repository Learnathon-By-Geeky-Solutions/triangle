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
      expect(AppFirebaseException('email-already-exists').message,
          'The email address already exists. Please use a different email.');
      expect(AppFirebaseException('provider-already-linked').message,
          'The account is already linked with another provider.');
    });

    test('AppPlatformException returns correct message', () {
      expect(AppPlatformException('network-request-failed').message,
          'Network request failed. Please check your internet connection.');
      expect(AppPlatformException('invalid-credential').message,
          'The supplied credential is malformed or has expired.');
      expect(AppPlatformException('user-token-expired').message,
          'The user\'s token has expired, and authentication is required. Please sign in again.');
      expect(AppPlatformException('user-token-revoked').message,
          'The user\'s token has been revoked. Please sign in again.');
      expect(AppPlatformException('invalid-sender').message,
          'The email template sender is invalid. Please verify the sender\'s email.');
    });
  });
}
