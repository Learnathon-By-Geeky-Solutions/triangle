import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount); // Customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a Bangladeshi phone number format: +880 1XXX-XXXXXX
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters

    if (phoneNumber.startsWith('880')) {
      phoneNumber = '+880${phoneNumber.substring(3)}';
    } else if (phoneNumber.startsWith('0')) {
      phoneNumber = '+880${phoneNumber.substring(1)}';
    } else if (!phoneNumber.startsWith('+880')) {
      phoneNumber = '+880$phoneNumber';
    }

    if (phoneNumber.length == 14) {
      return '${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 8)}-${phoneNumber.substring(8)}';
    }

    return phoneNumber; // Return as is if it doesn't match the expected format
  }


  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure the phone number has at least a country code and some digits
    if (digitsOnly.length < 3) {
      throw ArgumentError('Phone number is too short to format.');
    }

    // Extract the country code (assuming it's up to 3 digits long)
    String countryCode;
    if (digitsOnly.startsWith('1')) {
      countryCode = '+1'; // For US/Canada
      digitsOnly = digitsOnly.substring(1);
    } else if (digitsOnly.length > 3) {
      countryCode = '+${digitsOnly.substring(0, 3)}';
      digitsOnly = digitsOnly.substring(3);
    } else {
      countryCode = '+${digitsOnly.substring(0, 2)}';
      digitsOnly = digitsOnly.substring(2);
    }

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('$countryCode ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = (i == 0 && countryCode == '+1') ? 3 : 2;
      int end = i + groupLength;

      if (end > digitsOnly.length) {
        end = digitsOnly.length;
      }

      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}
