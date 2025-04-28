import '../../models/user/user_model.dart';

abstract class UserRepository {
  Future<void> saveUserData(UserModel user);
}