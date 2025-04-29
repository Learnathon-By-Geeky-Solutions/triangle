import '../../models/user/user_model.dart';

abstract class UserRepository {
  Future<String> saveUserData(UserModel user);
}