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
  var requiredMaterial = <RequiredMaterialModel>[].obs;
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
    getRequiredMaterial();
    getArchiveApp();
    super.onInit();
  }

  List<String> title = [
    "Booking \nAppointment",
    "Diagnostic record",
    "My Appoitment",
    "Required materials",
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

  RxBool isLoading = false.obs;
  Future<void> fetchMyAppointement() async {
    try {
      isLoading.value = true;
      final fetchData = await HomeService.fetchDataMyAppointment();
      myAppointment.assignAll(fetchData);
    } catch (e) {
      print("Error Fetch My Appointment $e");
    } finally {
      isLoading.value = false;
    }
  }

  String formatDate(String history) {
    DateTime date = DateTime.parse(history);
    history = DateFormat('EEEE').format(date);
    return history;
  }

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  String formatTime(String timeString) {
    DateTime dateTime = DateTime.parse('1970-01-01T$timeString');

    String formattedTime = DateFormat('h:mm:ss a').format(dateTime);

    return formattedTime;
  }

  Future<void> getRequiredMaterial() async {
    try {
      final List<RequiredMaterialModel> fetchData =
          await HomeService.getRequiredMaterial();
      requiredMaterial.value = fetchData;
    } catch (e) {
      rethrow;
    }
  }

  var archiveApp = <ArchiveAppModel>[].obs;
  Future<void> getArchiveApp() async {
    try {
      final List<ArchiveAppModel> fetchData = await HomeService.getArchiveApp();
      archiveApp.assignAll(fetchData);
    } catch (e) {
      rethrow;
    }
  }
}
