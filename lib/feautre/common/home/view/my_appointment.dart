import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class MyAppointment extends StatelessWidget {
  MyAppointment({super.key});
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("My Appointment"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Card(
                  elevation: 4,
                  color: Palette.primaryLight,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                    title: Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.white,
                    ),
                    subtitle: Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.white,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Palette.primary),
                  ),
                ),
              );
            },
          );
        }
        if (_controller.myAppointment.isEmpty) {
          return const Center(child: Text("No appointments."));
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: _controller.myAppointment.length,
          itemBuilder: (context, index) {
            return Container(
              height: 55,
              decoration: BoxDecoration(
                color: Palette.primaryLight,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 2,
                  )
                ],
              ),
              child: ListTile(
                dense: true,
                textColor: Palette.black,
                title: Text(
                  _controller.formatDate(_controller
                      .myAppointment[index].detailsSessionModel.history),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 19,
                      ),
                ),
                subtitle: Text(
                  _controller.myAppointment[index].detailsSessionModel.history,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                  _controller.formatTime(_controller
                      .myAppointment[index].detailsSessionModel.time),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 20),
        );
      }),
    );
  }
}
