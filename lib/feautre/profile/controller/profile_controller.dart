// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class ProfileController extends GetxController {
  final Rx<File?> _image = Rx<File?>(null);
  File? get image => _image.value;

  void selectImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Center(
            child: Text(
              "Select Image",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  await pickImage(ImageSource.camera);
                  Get.back();
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.camera_enhance,
                    size: 30,
                    color: Color(0xFFB74D3F),
                  ),
                  title: Text(
                    "From Camera",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              InkWell(
                onTap: () async {
                  await pickImage(ImageSource.gallery);
                  Get.back();
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.camera,
                    size: 30,
                    color: Color(0xFFB74D3F),
                  ),
                  title: Text(
                    "From Gallery",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      _image.value = File(pickedImage.path);
      update();
    } else {
      print("Error");
    }
  }

  void logout() {
    Get.bottomSheet(
      Logout(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
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
