import 'package:proyecto/data/models/models.dart';

abstract class UserService {
  Future<int> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<UserModel?> getUser(String userId);
  Future<void> deleteUser(String userId);
}