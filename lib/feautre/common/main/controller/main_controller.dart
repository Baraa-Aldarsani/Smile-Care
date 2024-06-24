import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/feautre/feautre.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';

class MainController extends GetxController {
  int _selectedIndex = 0;

  Widget _currentScreen = HomeScreen();

  get selectedIndex => _selectedIndex;

  get currentScreen => _currentScreen;

  void onItemTapped(int index, BuildContext context) {
    _selectedIndex = index;
    update();
    switch (index) {
      case 0:
        _currentScreen = HealthRecordScreen();
        break;
      case 1:
        _currentScreen = StudentSessions();
      case 2:
        _currentScreen = HomeScreen();
        break;
      case 3:
        _currentScreen = ProfileScreen();
        break;
    }
  }

  int _currentIndex = 2;
  get currentIndex => _currentIndex;

  void selectedButton(int index) {
    _currentIndex = index;
    update();
  }
}
