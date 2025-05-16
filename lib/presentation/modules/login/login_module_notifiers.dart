import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/login/login_service.dart';

class LoginStateNotifier extends StateNotifier<ServiceResultGenericState<UserModel>> {
  LoginStateNotifier(this._loginService) : super(const ServiceResultGenericState.init());

  final LoginService _loginService;

  Future<void> login(String email, String password) async {
    state = const ServiceResultGenericState.loading();
    try {
      final user = await _loginService.login(email: email, password: password);
      state = ServiceResultGenericState.success(user);
    } catch (e) {
      state = ServiceResultGenericState.error(e.toString());
    }
  }

  void resetState() => state = const ServiceResultGenericState.init();
}