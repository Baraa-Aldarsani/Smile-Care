import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/common/main/main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primary,
          title: const Text('Home Screen'),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).extension<EXTColors>()!.background,
              ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(Images.listMenue, scale: 0.8),
            )
          ],
        ),
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(context),
      ),
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (controller) => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Health Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),

            label: 'Profile',
            tooltip: "asdasd"
          ),
        ],
        currentIndex: controller.selectedIndex,
        onTap: (index) {
          controller.onItemTapped(index, context);
        },
      ),
    );
  }
}
