// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smile_care/apis/apis.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class HomeController extends GetxController {
  int counter = 0;
  RxInt selectedMaterila = (-1).obs;
  final TextEditingController reason = TextEditingController();

  var myAppointment = <SessionSummaryModel>[].obs;
  increase() {
    counter < 3 ? counter++ : counter = 0;
    update();
  }

  decrease() {
    counter > 0 ? counter-- : counter = 3;
    update();
  }

  @override
  void onInit() {
    fetchMyAppointement();
    super.onInit();
  }

  List<String> title = [
    "Booking \nAppointment",
    "Record of \nvisits",
    "My Appoitment",
    "Required materials",
    "Test results",
    "",
  ];

  Future<void> bookAppointment(BuildContext context) async {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));
      await HomeService.bookAppointment(reason.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Success booking appointment'),
        backgroundColor: Palette.primary,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Faild booking appointment'),
        backgroundColor: Palette.red,
      ));
    }
  }

  Future<void> fetchMyAppointement() async {
    try {
      final fetchData = await HomeService.fetchDataMyAppointment();
      myAppointment.assignAll(fetchData);
    } catch (e) {
      print("Error Fetch My Appointment $e");
    }
  }

  String formatDate(String history) {
    DateTime date = DateTime.parse(history);
    history = DateFormat('EEEE').format(date);
    return history;
  }
}
