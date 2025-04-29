import 'package:triangle/data/repositories/user/user_repository.dart';

import '../../models/user/user_model.dart';

class MockUserRepositoryImpl extends UserRepository {
  @override
  Future<String> saveUserData(UserModel user) async {
    // Mock implementation: Simulate a delay and return without doing anything
    await Future.delayed(const Duration(seconds: 1));
    return "";
  }
  
  @override
  Future<UserModel?> getUserData() {
    throw UnimplementedError();
  }
  
  @override
  String? get userId => throw UnimplementedError();
}