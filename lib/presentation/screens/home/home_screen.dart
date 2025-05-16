import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/screens/home/home_options.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeModuleController);
    final navigationIndex = ref.watch(navigationIndexProvider);
    final screens = getScreens();
    final navItems = getBottomNavigationBarItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanFood'),
      ),
      body: screens[navigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: navigationIndex,
        onTap: controller.updateNavigationIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}
