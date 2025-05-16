import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/preferences/app_preferences.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/user/user_service.dart';

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier({
    required this.userService,
    required this.prefs,
  }) : super(const SignupState());

  final UserService userService;
  final AppPreferences prefs;

  Future<void> createUser(UserModel user) async {
    state = const SignupState(state: SignupStates.loading);
    try {
      final userId = await userService.createUser(user);

      await prefs.saveString(key: AppConstants.userId, value: userId.toString());

      state = const SignupState(state: SignupStates.success);
    } catch (e) {
      state = const SignupState(state: SignupStates.error);
    }
  }

  void resetState() => state = const SignupState();
}
