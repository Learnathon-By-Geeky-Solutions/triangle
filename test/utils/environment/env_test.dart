import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:triangle/utils/environment/env.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
  });

  group('Env', () {
    test('androidApiKey returns correct value', () {
      expect(Env.androidApiKey, dotenv.env['ANDROID_API_KEY'] ?? '');
    });

    test('androidAppId returns correct value', () {
      expect(Env.androidAppId, dotenv.env['ANDROID_APP_ID'] ?? '');
    });

    test('androidMessagingSenderId returns correct value', () {
      expect(Env.androidMessagingSenderId, dotenv.env['ANDROID_MESSAGING_SENDER_ID'] ?? '');
    });

    test('androidProjectId returns correct value', () {
      expect(Env.androidProjectId, dotenv.env['ANDROID_PROJECT_ID'] ?? '');
    });

    test('androidStorageBucket returns correct value', () {
      expect(Env.androidStorageBucket, dotenv.env['ANDROID_STORAGE_BUCKET'] ?? '');
    });

    test('iosApiKey returns correct value', () {
      expect(Env.iosApiKey, dotenv.env['IOS_API_KEY'] ?? '');
    });

    test('iosAppId returns correct value', () {
      expect(Env.iosAppId, dotenv.env['IOS_APP_ID'] ?? '');
    });

    test('iosMessagingSenderId returns correct value', () {
      expect(Env.iosMessagingSenderId, dotenv.env['IOS_MESSAGING_SENDER_ID'] ?? '');
    });

    test('iosProjectId returns correct value', () {
      expect(Env.iosProjectId, dotenv.env['IOS_PROJECT_ID'] ?? '');
    });

    test('iosStorageBucket returns correct value', () {
      expect(Env.iosStorageBucket, dotenv.env['IOS_STORAGE_BUCKET'] ?? '');
    });

    test('iosBundleId returns correct value', () {
      expect(Env.iosBundleId, dotenv.env['IOS_BUNDLE_ID'] ?? '');
    });
  });
}
