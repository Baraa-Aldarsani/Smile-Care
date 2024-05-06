// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

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
                  context.pop();
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
                  context.pop();
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
      // ignore: avoid_print
      print("Error");
    }
  }
}
