import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/data/models/user/state/session_state.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/modules/splash/splash_module_providers.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbAsync = ref.watch(appDatabaseProvider);

    return dbAsync.when(
      data: (db) {
        final session = ref.watch(splashStateNotifierProvider(db));
        final controller = ref.watch(splashModuleController);

        useEffect(() {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.checkSession(db);
          });

          return null;
        }, []);

        useEffect(() {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final user = ref.watch(userProvider);
            switch (session.state) {
              case SessionStates.goToLogin:
                controller.goToLogin();
                break;
              case SessionStates.goToSignup:
                controller.goToSignup();
                break;
              case SessionStates.goToHome:
                controller.goToHome(user?.rol ?? '');
                break;
              default:
                break;
            }
          });

          return null;
        }, [session.state]);

        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(72),
                child: Center(child: Lottie.asset(AppConstants.splashAsset)),
              ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: Text('Loading')),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}
