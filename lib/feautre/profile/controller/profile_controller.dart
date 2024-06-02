// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/apis/apis.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class ProfileController extends GetxController {
  var profileData = ProfileModel();
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void logout() {
    Get.bottomSheet(
      Logout(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  Future<void> fetchUser() async {
    try {
      final ProfileModel fetchedUser = await ProfileService.getUserInfo();
      profileData = fetchedUser;
      update();
     
    } catch (e) {
      print('Error fetching user: $e');
    }
  }
}

class Logout extends StatelessWidget {
  Logout({super.key});
  final LocalStorageData localStorageData = Get.put(LocalStorageData());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          _buildDivider(),
          const SizedBox(height: 30),
          const Text(
            "Logout",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Palette.red),
          ),
          const SizedBox(height: 30),
          const Text(
            "Are you sure you want to log out?",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          _buildButtons(
              label: 'Yes, Logout',
              backgroundColor: Palette.primary,
              textColor: Palette.primaryLight,
              onPressed: () {
                localStorageData.deleteUser();
                Get.offAll(SignIn());
              }),
          const SizedBox(height: 20),
          _buildButtons(
              label: 'Cancel',
              backgroundColor: Palette.primaryLight,
              textColor: Palette.primary,
              onPressed: () {
                Get.back();
              }),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 5,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Palette.grey,
      ),
    );
  }

  Widget _buildButtons(
      {required String label,
      required Color backgroundColor,
      required Color textColor,
      required VoidCallback onPressed}) {
    return _buildMaterialButton(
        label: label,
        backgroundColor: backgroundColor,
        textColor: textColor,
        onPressed: onPressed);
  }

  Widget _buildMaterialButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: MaterialButton(
        height: 40,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: backgroundColor),
        ),
        color: backgroundColor,
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
