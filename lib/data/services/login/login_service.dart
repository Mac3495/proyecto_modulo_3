import 'package:proyecto/data/models/models.dart';

abstract class LoginService {
  Future<UserModel> login({required String email, required String password});
}