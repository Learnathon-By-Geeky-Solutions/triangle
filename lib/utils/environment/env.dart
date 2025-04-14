// lib/utils/environment/env.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get androidApiKey => dotenv.env['ANDROID_API_KEY'] ?? '';
  static String get androidAppId => dotenv.env['ANDROID_APP_ID'] ?? '';
  static String get androidMessagingSenderId => dotenv.env['ANDROID_MESSAGING_SENDER_ID'] ?? '';
  static String get androidProjectId => dotenv.env['ANDROID_PROJECT_ID'] ?? '';
  static String get androidStorageBucket => dotenv.env['ANDROID_STORAGE_BUCKET'] ?? '';

  static String get iosApiKey => dotenv.env['IOS_API_KEY'] ?? '';
  static String get iosAppId => dotenv.env['IOS_APP_ID'] ?? '';
  static String get iosMessagingSenderId => dotenv.env['IOS_MESSAGING_SENDER_ID'] ?? '';
  static String get iosProjectId => dotenv.env['IOS_PROJECT_ID'] ?? '';
  static String get iosStorageBucket => dotenv.env['IOS_STORAGE_BUCKET'] ?? '';
  static String get iosBundleId => dotenv.env['IOS_BUNDLE_ID'] ?? '';

  // Add getters for other environment variables as needed
}