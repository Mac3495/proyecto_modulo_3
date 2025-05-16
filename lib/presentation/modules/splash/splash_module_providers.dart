import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/splash/splash_module_controller.dart';
import 'package:proyecto/presentation/modules/splash/splash_module_notifiers.dart';
import 'package:sqflite/sqflite.dart';

final splashModuleController = Provider.autoDispose<SplashModuleController>(
  (ref) => SplashModuleController(ref),
);

final splashStateNotifierProvider =
    StateNotifierProvider.autoDispose.family<SplashStateNotifier, SessionState, Database>(
  (ref, db) => SplashStateNotifier(db, ref),
);
