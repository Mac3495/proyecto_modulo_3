import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/login/login_service.dart';
import 'package:sqflite/sqflite.dart';

class LoginServiceImpl implements LoginService {
  final Database db;

  LoginServiceImpl(this.db);

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final result = await db.query(
      'users',
      where: 'userEmail = ?',
      whereArgs: [email],
    );

    if (result.isEmpty) {
      throw Exception('Usuario no registrado');
    }

    final user = UserModel.fromJson(result.first);

    if (user.password != password) {
      throw Exception('Contraseña incorrecta');
    }

    return user;
  }
}
