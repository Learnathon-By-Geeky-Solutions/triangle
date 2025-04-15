import 'package:flutter_test/flutter_test.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';

void main() {
  group('AppFormatException', () {
    test('create a format exception from a specific error message', () {
      expect(AppFormatException.fromMessage('Error message').formattedMessage, 'Error message');
    });

    test('create a format exception from a specific error code', () {
      expect(AppFormatException.fromCode('invalid-email-format').formattedMessage, 'The email address format is invalid. Please enter a valid email.');
      expect(AppFormatException.fromCode('invalid-phone-number-format').formattedMessage, 'The provided phone number format is invalid. Please enter a valid number.');
      expect(AppFormatException.fromCode('invalid-date-format').formattedMessage, 'The date format is invalid. Please enter a valid date.');
      expect(AppFormatException.fromCode('invalid-url-format').formattedMessage, 'The URL format is invalid. Please enter a valid URL.');
      expect(AppFormatException.fromCode('invalid-credit-card-format').formattedMessage, 'The credit card format is invalid. Please enter a valid credit card number.');
      expect(AppFormatException.fromCode('invalid-numeric-format').formattedMessage, 'The input should be a valid numeric format.');
    });
  });
}