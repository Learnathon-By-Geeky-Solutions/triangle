import 'package:triangle/data/repositories/user/user_repository.dart';

import '../../models/user/user_model.dart';

class MockUserRepositoryImpl extends UserRepository {
  @override
  Future<void> saveUserData(UserModel user) async {
    // Mock implementation: Simulate a delay and return without doing anything
    await Future.delayed(const Duration(seconds: 1));
    return;
  }
}