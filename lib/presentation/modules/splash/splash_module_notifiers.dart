import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:sqflite/sqflite.dart';

class SplashStateNotifier extends StateNotifier<SessionState> {
  SplashStateNotifier(this.db, this.ref) : super(const SessionState());

  final Database db;
  final Ref ref;

  Future<void> checkSession({required String? userId}) async {
    await Future.delayed(const Duration(seconds: 1));
    if (userId != null && userId.isNotEmpty) {
      final result = await db.query(
        'users',
        where: 'userId = ?',
        whereArgs: [int.parse(userId)],
      );

      if (result.isNotEmpty) {
        final user = UserModel.fromJson(result.first);
        ref.read(userProvider.notifier).state = user;
        state = const SessionState(state: SessionStates.goToHome);
        return;
      }
    }

    final count = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM users'),
        ) ??
        0;

    if (count > 0) {
      state = const SessionState(state: SessionStates.goToLogin);
    } else {
      state = const SessionState(state: SessionStates.goToSignup);
    }
  }
}
