import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smile_care/apis/apis.dart';
import 'package:smile_care/feautre/feautre.dart';

class EditProfileController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();
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

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1930),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      String formattedDate =
          DateFormat('yyyy-MM-dd').format(selectedDate.value);
      dateController.text = formattedDate;
    }
  }

  var selectedGender = (-1).obs;

  List<String> gender = [
    "Male",
    "Female",
  ];

  Future<void> updateUserInfo(ProfileModel profileModel, File? image) async {
    try {
      await ProfileService.updateUserInfo(profileModel, image);
      Get.back();
      update();
    } catch (e) {
      print('Error updating user: $e');
    }
  }
}
