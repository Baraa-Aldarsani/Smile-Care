import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: ListView.separated(
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
                "01:40",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 20),
      ),
    );
  }
}
