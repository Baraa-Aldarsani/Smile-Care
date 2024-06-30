import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class RecordOfVisits extends StatelessWidget {
  RecordOfVisits({super.key});
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Diagnostic record"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _controller.archiveApp.length,
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
                _controller.formatDate(_controller.archiveApp[index].date),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 19,
                    ),
              ),
              subtitle: Text(
                _controller.archiveApp[index].date,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Text(
                _controller.formatTime(_controller.archiveApp[index].time),
                // _controller.formatDateTime(_controller.archiveApp[index].time),
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
