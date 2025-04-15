import 'package:flutter_test/flutter_test.dart';
import 'package:triangle/utils/validators/app_validator.dart';

void main() {
  group('AppValidator', () {
    test('validateEmail returns error for null or empty email', () {
      expect(AppValidator.validateEmail(null), 'Email is required.');
      expect(AppValidator.validateEmail(''), 'Email is required.');
    });

    test('validateEmail returns error for invalid email format', () {
      expect(AppValidator.validateEmail('invalidemail'), 'Invalid email address.');
    });

    test('validateEmail returns null for valid email', () {
      expect(AppValidator.validateEmail('test@example.com'), null);
    });

    test('validatePassword returns error for null or empty password', () {
      expect(AppValidator.validatePassword(null), 'Password is required.');
      expect(AppValidator.validatePassword(''), 'Password is required.');
    });

    test('validatePassword returns error for short password', () {
      expect(AppValidator.validatePassword('Pas1!'), 'Password must be at least 6 characters long.');
    });

    test('validatePassword returns error for missing uppercase letter', () {
      expect(AppValidator.validatePassword('password1!'), 'Password must contain at least one uppercase letter.');
    });

    test('validatePassword returns error for missing number', () {
      expect(AppValidator.validatePassword('Password!'), 'Password must contain at least one number.');
    });

    test('validatePassword returns error for missing special character', () {
      expect(AppValidator.validatePassword('Password1'), 'Password must contain at least one special character.');
    });

    test('validatePassword returns null for valid password', () {
      expect(AppValidator.validatePassword('Password1!'), null);
    });

    test('validateConfirmPassword returns error for null or empty confirm password', () {
      expect(AppValidator.validateConfirmPassword('Password1!', null), 'Confirm password is required.');
      expect(AppValidator.validateConfirmPassword('Password1!', ''), 'Confirm password is required.');
    });

    test('validateConfirmPassword returns error for non-matching passwords', () {
      expect(AppValidator.validateConfirmPassword('Password1!', 'Password2!'), 'Passwords do not match.');
    });

    test('validateConfirmPassword returns null for matching passwords', () {
      expect(AppValidator.validateConfirmPassword('Password1!', 'Password1!'), null);
    });

    test('validatePhoneNumber returns error for null or empty phone number', () {
      expect(AppValidator.validatePhoneNumber(null), 'Phone number is required.');
      expect(AppValidator.validatePhoneNumber(''), 'Phone number is required.');
    });

    test('validatePhoneNumber returns error for invalid phone number format', () {
      expect(AppValidator.validatePhoneNumber('123456'), 'Invalid phone number format.');
    });

    test('validatePhoneNumber returns null for valid phone number', () {
      expect(AppValidator.validatePhoneNumber('01712345678'), null);
    });

    test('validateName returns error for null or empty name', () {
      expect(AppValidator.validateName(null), 'Name is required.');
      expect(AppValidator.validateName(''), 'Name is required.');
    });

    test('validateName returns error for invalid name format', () {
      expect(AppValidator.validateName('Name123'), 'Invalid name format.');
    });

    test('validateName returns null for valid name', () {
      expect(AppValidator.validateName('John Doe'), null);
    });
  });
}
