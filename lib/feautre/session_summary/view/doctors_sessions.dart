import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class DoctorsSessions extends StatelessWidget {
  const DoctorsSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Doctors Sessions"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Images.logoAuth),
        ),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 55,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Palette.grey : Palette.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(1.5, 1.5),
                  blurRadius: 2,
                )
              ],
            ),
            child: InkWell(
              onTap: () {
                Get.to(PatientSessions());
              },
              child: _bodyWidget(context),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        ClipOval(
          child: Image.asset("assets/images/Capture.png", fit: BoxFit.cover),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Baraa Aldarsani",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).extension<EXTColors>()!.black),
            ),
            Text(
              "Sessions description",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
