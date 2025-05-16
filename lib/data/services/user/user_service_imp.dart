import 'package:proyecto/data/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final Database db;

  UserServiceImpl(this.db);

  @override
  Future<int> createUser(UserModel user) async {
    final userMap = user.toJson();
    userMap.remove('userId');

    final id = await db.insert(
      'users',
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await db.update(
      'users',
      user.toJson(),
      where: 'user_id = ?',
      whereArgs: [user.userId],
    );
  }

  @override
  Future<UserModel?> getUser(String userId) async {
    final result = await db.query(
      'users',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    await db.delete(
      'users',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }
}
