import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';

class StepperController extends GetxController {
  var currentStep = 0.obs;
  var imageListRadiographs = <XFile>[].obs;
  var imageListMedicines = <MedicineModel>[].obs;
  var selectedIndex = List<bool>.filled(4, false).obs;
  final ImagePicker picker = ImagePicker();
  final ImagePicker pickerOneImage = ImagePicker();
  List<String> checkBox = [
    "ddddddddddd",
    "ccccccccccc",
    "eeeeeeeeeee",
    "aaaaaaaaaaa",
  ];
  XFile? oneImage;
  final TextEditingController nameMedicine = TextEditingController();
  void stepContinue() {
    if (currentStep < 2) {
      currentStep++;
    }
  }

  void stepCancel() {
    if (currentStep > 0) {
      currentStep--;
    }
  }

  Future<void> pickImagesRadiographs() async {
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages != null) {
      imageListRadiographs.addAll(selectedImages);
    }
  }

  Future<void> pickImagesMedicines() async {
    final XFile? selectedImages =
        await pickerOneImage.pickImage(source: ImageSource.camera);
    if (selectedImages != null) {
      oneImage = selectedImages;
      update();
    }
  }

  void addMedicines(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Palette.primaryLight,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Center(
            child: Text(
              "Add Medicine",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: nameMedicine,
                title: "Name of the drug",
                icon: Icons.medical_services_rounded,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pickImagesMedicines();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Palette.black,
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text('Add Radiographs'),
                  ),
                  GetBuilder(
                    init: StepperController(),
                    builder: (controller) => ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: controller.oneImage != null
                          ? Image.file(
                              File(controller.oneImage!.path),
                              fit: BoxFit.cover,
                              height: 75,
                              width: 75,
                            )
                          : const SizedBox(),
                    ),
                  )
                ],
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
                nameMedicine.clear();
                oneImage = null;
              },
              child: const Text(
                "cancel",
                style: TextStyle(color: Palette.red),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                if (oneImage != null && nameMedicine.text.isNotEmpty) {
                  addMedicineToList(nameMedicine.text, oneImage!);
                  Get.back();
                  nameMedicine.clear();
                  oneImage = null;
                }
              },
              child: const Text(
                "Ok",
                style: TextStyle(color: Palette.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  void addMedicineToList(String nameMedicine, XFile image) {
    imageListMedicines.add(MedicineModel(name: nameMedicine, image: image));
  }

  void removeNodeRadiographs(int index) {
    imageListRadiographs.removeAt(index);
  }

  void removeNodeMedicines(int index) {
    imageListMedicines.removeAt(index);
  }

  void toggleCheckbox(int index, bool? value) {
    if (value != null) {
      selectedIndex[index] = value;
    }
  }
}
