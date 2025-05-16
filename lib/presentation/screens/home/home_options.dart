import 'package:flutter/material.dart';
import 'package:proyecto/presentation/screens/home/ingredient/ingredient_screen.dart';
import 'package:proyecto/presentation/screens/home/profile/profile_screen.dart';
import 'package:proyecto/presentation/screens/home/scanner/scanner_screen.dart';

List<Widget> getScreens() {
  return const [
    ScannerScreen(),
    IngredientScreen(),
    ProfileScreen(),
  ];
}

List<BottomNavigationBarItem> getBottomNavigationBarItems() {
  return const [
    BottomNavigationBarItem(
      icon: Icon(Icons.fullscreen),
      label: 'Scanner',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dining),
      label: 'Ingredientes',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Perfil',
    ),
  ];
}
