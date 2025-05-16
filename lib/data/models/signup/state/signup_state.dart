import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

enum SignupStates {
  init,
  loading,
  success,
  error,
}

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(SignupStates.init) SignupStates state,
  }) = _SignupState;
}