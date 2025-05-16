import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/service_providers.dart';
import 'package:proyecto/presentation/modules/login/login_module_controller.dart';
import 'package:proyecto/presentation/modules/login/login_module_notifiers.dart';

final loginModuleControllerProvider =
    Provider<LoginModuleController>((ref) => LoginModuleController(ref));

final emailLoginProvider = StateProvider.autoDispose<String>((ref) => '');

final passwordLoginProvider = StateProvider.autoDispose<String>((ref) => '');

final isVisibleLoginPasswordProvider = StateProvider.autoDispose<bool>((ref) => false);

final formLoginKeyProvider = Provider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

final loginStateNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, ServiceResultGenericState<UserModel>>(
  (ref) => LoginStateNotifier(ref.watch(loginServiceProvider)),
);
