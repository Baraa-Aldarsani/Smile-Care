import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/feautre/common/home/home.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';
import 'package:smile_care/feautre/profile/prodile.dart';

class MainController extends GetxController {
  int _selectedIndex = 0;

  Widget _currentScreen = const HomeScreen();

  get selectedIndex => _selectedIndex;

  get currentScreen => _currentScreen;

  void onItemTapped(int index, BuildContext context) {
    _selectedIndex = index;
    update();
    switch (index) {
      case 0:
        _currentScreen = const HealthRecordScreen();
        break;
      case 1:
        _currentScreen = const HomeScreen();
        break;
      case 2:
        _currentScreen = const ProfileScreen();
        break;
    }
  }
}
