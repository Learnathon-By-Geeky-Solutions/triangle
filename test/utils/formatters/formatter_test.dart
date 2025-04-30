import 'package:flutter_test/flutter_test.dart';
import 'package:triangle/utils/formatters/formatter.dart';

void main() {
  group('Formatter', () {
    test('formatDate returns the correct formatted date', () {
      final date = DateTime(2022, 1, 1);
      expect(Formatter.formatDate(date), '2022-01-01');
    });

    test('formatCurrency returns the correct formatted currency', () {
      expect(Formatter.formatCurrency(1234.56), '\$1,234.56');
    });

    test('formatPhoneNumber returns the correct formatted phone number', () {
      expect(Formatter.formatPhoneNumber('+8801234567890'), '+880 1234-567890');
      expect(Formatter.formatPhoneNumber('01234567890'), '+880 1234-567890');
      expect(Formatter.formatPhoneNumber('1234567890'), '+880 1234-567890');
      expect(Formatter.formatPhoneNumber('+8801234567801'), '+880 1234-567801');
    });
    test('internationalFormatPhoneNumber returns the correct formatted phone number', () {
      expect(Formatter.internationalFormatPhoneNumber('+8801234567890'), '+880 12 34 56 78 90');
      expect(Formatter.internationalFormatPhoneNumber('01234567890'), '+012 34 56 78 90');
    });
  });
}

