import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final TextEditingController dateController = TextEditingController();

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

  var selectedCity = (-1).obs;
  List<String> city = ["Damascus", "Aleppo", "Rif Dimasq"];

  var selectedGender = (-1).obs;

  List<String> gender = [
    "Male",
    "Female",
  ];
}
