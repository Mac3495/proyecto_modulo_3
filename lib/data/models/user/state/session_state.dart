import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_state.freezed.dart';

enum SessionStates {
  init,
  goToLogin,
  goToSignup,
  goToHome,
}

@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    @Default(SessionStates.init) SessionStates state,
  }) = _SessionState;
}