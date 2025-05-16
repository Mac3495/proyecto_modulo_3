import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_result_generic_state.freezed.dart';

@freezed
class ServiceResultGenericState<T> with _$ServiceResultGenericState<T> {
  const factory ServiceResultGenericState.init() = _Init;
  const factory ServiceResultGenericState.loading() = _Loading;
  const factory ServiceResultGenericState.success(T data) = _Data;
  const factory ServiceResultGenericState.error(String error) = _Error;
}
