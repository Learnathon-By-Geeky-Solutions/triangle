import 'package:intl/intl.dart';

class AppHelperFunctions {
  static String getTodaysDate() {
    final DateTime now = DateTime.now();
    return DateFormat('EEEE, MMMM d').format(now);
  }
}