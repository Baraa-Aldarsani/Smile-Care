import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';

class HealthRecordScreen extends StatelessWidget {
  const HealthRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/Capture.png"),
        ),
        title: const Text("Health Record"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(DoctorsSessions());
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Palette.grey,
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
                  leading: Image.asset("assets/images/sessinos.png"),
                  title: const Text("Patient sessions"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Palette.background,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Get.to(DetailsHealthRecordScreen());
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Palette.primary,
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
                  leading: Image.asset("assets/images/health_record.png"),
                  title: const Text("Health Record"),
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
                          color: Theme.of(context)
                              .extension<EXTColors>()!
                              .background),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Palette.background,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
