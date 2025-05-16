import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/service_providers.dart';
import 'package:proyecto/presentation/modules/signup/signup_module_controller.dart';
import 'package:proyecto/presentation/modules/signup/signup_module_notifiers.dart';

final signupModuleController = Provider.autoDispose<SignupModuleController>(
  (ref) => SignupModuleController(ref),
);

final nameProvider = StateProvider.autoDispose<String>((ref) => '');

final emailProvider = StateProvider.autoDispose<String>((ref) => '');

final passwordProvider = StateProvider.autoDispose<String>((ref) => '');

final isVisiblePasswordProvider = StateProvider.autoDispose<bool>((ref) => false);

final formKeyProvider = Provider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

final signupStateNotifierProvider = StateNotifierProvider<SignupStateNotifier, SignupState>(
  (ref) {
    final userService = ref.read(userServiceProvider);
    final prefs = ref.read(appPreferencesProvider);
    return SignupStateNotifier(userService: userService, prefs: prefs);
  },
);
