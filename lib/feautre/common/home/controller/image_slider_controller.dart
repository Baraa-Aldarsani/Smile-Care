import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSliderController extends GetxController {
  var currentPage = 0.obs;
  late Timer timer;
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage.value < 3) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    timer.cancel();
    super.onClose();
  }
}
