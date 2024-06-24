import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class StudentSessions extends StatelessWidget {
  StudentSessions({super.key});
  final StudentController _controller = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Student Sessions"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Images.logoAuth),
        ),
      ),
      body: FutureBuilder(
          future: _controller.getInfoStudent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            } else {
              return ListView.separated(
                itemCount: _controller.studentInfo.length,
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
                        Get.to(
                            PatientSessions(_controller.studentInfo[index]));
                      },
                      child: _bodyWidget(context, index),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
              );
            }
          }),
    );
  }

  Widget _bodyWidget(BuildContext context, int index) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: Palette.primaryDark,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child: Text(
            _controller.studentInfo[index].year,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${_controller.studentInfo[index].fName} ${_controller.studentInfo[index].lName}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).extension<EXTColors>()!.black),
            ),
            Row(
              children: [
                Text(
                  _controller.studentInfo[index].specialization,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(width: 165),
                Text(
                  _controller.studentInfo[index].gender,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
