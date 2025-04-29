import '../../models/user/user_model.dart';

abstract class UserRepository {
  String? get userId;
  Future<String> saveUserData(UserModel user);
  Future<UserModel?> getUserData();
}