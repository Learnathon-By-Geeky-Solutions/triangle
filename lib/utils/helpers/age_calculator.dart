class AgeCalculator {
  static Map<String, int> calculateAge(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);
    return _breakdownAge(difference.inDays);
  }

  static Map<String, int> _breakdownAge(int totalDays) {
    final years = totalDays ~/ 365;
    final remainingDaysAfterYears = totalDays % 365;
    final months = remainingDaysAfterYears ~/ 30;
    final remainingDaysAfterMonths = remainingDaysAfterYears % 30;
    final weeks = remainingDaysAfterMonths ~/ 7;
    final days = remainingDaysAfterMonths % 7;

    return {
      'years': years,
      'months': months,
      'weeks': weeks,
      'days': days,
    };
  }


  static Map<String, String> getAgeInAllFormats(DateTime dob) {
    return {
      'years': calculateYears(dob),
      'months': calculateTotalMonths(dob),
      'weeks': calculateTotalWeeks(dob),
      'days': calculateTotalDays(dob),
    };
  }  

  static String calculateYears(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);
    final years = difference.inDays ~/ 365;
    return years.toString();
  }

  static String calculateTotalMonths(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);
    final months = difference.inDays ~/ 30;
    return months.toString();
  }

  static String calculateTotalWeeks(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);
    final weeks = difference.inDays ~/ 7;
    return weeks.toString();
  }

  static String calculateTotalDays(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);
    return difference.inDays.toString();
  }
}