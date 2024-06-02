// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/common/main/main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBa(context),
      ),
    );
  }

  Widget bottomNavigationBa(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder(
      init: MainController(),
      builder: (controller) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
              right: BorderSide(width: 1, color: Colors.grey),
              left: BorderSide(width: 1, color: Colors.grey),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        height: size.width * .155,
        child: ListView.separated(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.onItemTapped(index, context);
              controller.selectedButton(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: size.width * .0014),
                Image.asset(Images.listOfIcons[index],
                    scale: index == controller.currentIndex ? 1.001 : 1.4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 2400),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    top: index == controller.currentIndex
                        ? 5.5
                        : size.width * .0029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .153,
                  height:
                      index == controller.currentIndex ? size.width * .011 : 0,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 1);
          },
        ),
      ),
    );
  }
}
