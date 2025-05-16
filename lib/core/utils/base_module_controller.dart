import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/core/router/navigation/app_navigator.dart';

class BaseModuleController {
  BaseModuleController(this.ref);

  @protected
  final Ref ref;

  @protected
  AppNavigator get navigator => ref.read(appNavigatorProvider);

  void goBack() => navigator.pop();
}
