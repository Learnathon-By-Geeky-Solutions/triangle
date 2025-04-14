abstract class AppBaseException implements Exception {
  final String code;

  AppBaseException(this.code);

  /// This method will be used to fetch the appropriate message for each error code.
  String get message => getMessage(code);

  // Shared logic to handle error messages
  String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' => 'The email address is already registered. Please use a different email.',
      'invalid-email' => 'The email address provided is invalid. Please enter a valid email.',
      'weak-password' => 'The password is too weak. Please choose a stronger password.',
      'user-disabled' => 'This user account has been disabled. Please contact support for assistance.',
      'user-not-found' => 'Invalid login details. User not found.',
      'wrong-password' => 'Incorrect password. Please check your password and try again.',
      'invalid-verification-code' => 'Invalid verification code. Please enter a valid code.',
      'invalid-verification-id' => 'Invalid verification ID. Please request a new verification code.',
      'quota-exceeded' => 'Quota exceeded. Please try again later.',
      'email-already-exists' => 'The email address already exists. Please use a different email.',
      'provider-already-linked' => 'The account is already linked with another provider.',
      'requires-recent-login' => 'This operation is sensitive and requires recent authentication. Please log in again.',
      'credential-already-in-use' => 'This credential is already associated with a different user account.',
      'user-mismatch' => 'The supplied credentials do not correspond to the previously signed-in user.',
      'account-exists-with-different-credential' => 'An account already exists with the same email but different sign-in credentials.',
      'operation-not-allowed' => 'This operation is not allowed. Contact support for assistance.',
      'expired-action-code' => 'The action code has expired. Please request a new action code.',
      'invalid-action-code' => 'The action code is invalid. Please check the code and try again.',
      'missing-action-code' => 'The action code is missing. Please provide a valid action code.',
      'user-token-expired' => 'The user\'s token has expired, and authentication is required. Please sign in again.',
      'invalid-credential' => 'The supplied credential is malformed or has expired.',
      'user-token-revoked' => 'The user\'s token has been revoked. Please sign in again.',
      'invalid-message-payload' => 'The email template verification message payload is invalid.',
      'invalid-sender' => 'The email template sender is invalid. Please verify the sender\'s email.',
      'invalid-recipient-email' => 'The recipient email address is invalid. Please provide a valid recipient email.',
      'missing-iframe-start' => 'The email template is missing the iframe start tag.',
      'missing-iframe-end' => 'The email template is missing the iframe end tag.',
      'missing-iframe-src' => 'The email template is missing the iframe src attribute.',
      'auth-domain-config-required' => 'The authDomain configuration is required for the action code verification link.',
      'missing-app-credential' => 'The app credential is missing. Please provide valid app credentials.',
      'invalid-app-credential' => 'The app credential is invalid. Please provide a valid app credential.',
      'session-cookie-expired' => 'The Firebase session cookie has expired. Please sign in again.',
      'uid-already-exists' => 'The provided user ID is already in use by another user.',
      'invalid-cordova-configuration' => 'The provided Cordova configuration is invalid.',
      'app-deleted' => 'This instance of FirebaseApp has been deleted.',
      'user-token-mismatch' => 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.',
      'web-storage-unsupported' => 'Web storage is not supported or is disabled.',
      'app-not-authorized' => 'The app is not authorized to use Firebase Authentication with the provided API key.',
      'keychain-error' => 'A keychain error occurred. Please check the keychain and try again.',
      'internal-error' => 'An internal authentication error occurred. Please try again later.',
      'INVALID_LOGIN_CREDENTIALS' => 'Invalid login credentials.',
      'unknown' => 'An unknown Firebase error occurred. Please try again.',
      'invalid-custom-token' => 'The custom token format is incorrect. Please check your custom token.',
      'custom-token-mismatch' => 'The custom token corresponds to a different audience.',
      'captcha-check-failed' => 'The reCAPTCHA response is invalid. Please try again.',
      'too-many-requests' => 'Too many requests. Please try again later.',
      'invalid-argument' => 'Invalid argument provided to the authentication method.',
      'invalid-password' => 'Incorrect password. Please try again.',
      'invalid-phone-number' => 'The provided phone number is invalid.',
      'sign_in_failed' => 'Sign-in failed. Please try again.',
      'network-request-failed' => 'Network request failed. Please check your internet connection.',
      _ => 'An unexpected error occurred. Please try again.'
    };
  }
}

/// Firebase Authentication-related Exception
class AppFirebaseAuthException extends AppBaseException {
  AppFirebaseAuthException(super.code);

  @override
  String get message => getMessage(code);
}

/// General Firebase-related Exception (for other Firebase-related errors)
class AppFirebaseException extends AppBaseException {
  AppFirebaseException(super.code);

  @override
  String get message => getMessage(code);
}

/// Platform-related Exception (for errors coming from the platform)
class AppPlatformException extends AppBaseException {
  AppPlatformException(super.code);

  @override
  String get message => getMessage(code);
}