import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/services/service_providers.dart';
import 'package:proyecto/presentation/modules/product/product_controller.dart';
import 'package:proyecto/presentation/modules/product/product_module_notifiers.dart';

final productControllerProvider =
    Provider<ProductModuleController>((ref) => ProductModuleController(ref));

final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, ServiceResultGenericState<void>>(
  (ref) => ProductStateNotifier(ref.watch(ingredientServiceProvider)),
);

final ingredientNameProvider = StateProvider.autoDispose<String>((ref) => '');

final formProductKeyProvider = Provider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());
