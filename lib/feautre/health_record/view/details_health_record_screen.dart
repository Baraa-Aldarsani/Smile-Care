import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';

import '../../../core/core.dart';

class DetailsHealthRecordScreen extends StatelessWidget {
  DetailsHealthRecordScreen({super.key});
  final StepperController controller = Get.put(StepperController());
  ScrollController scollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Details Health Record"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Obx(() {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Palette.primary,
                ),
          ),
          child: Stepper(
            currentStep: controller.currentStep.value,
            onStepContinue: controller.stepContinue,
            onStepCancel: controller.stepCancel,
            steps: <Step>[
              _stepOne(),
              _stepTow(),
              _stepThree(context),
            ],
          ),
        );
      }),
    );
  }

  Step _stepOne() {
    return Step(
      subtitle: const Text("Radiographs section"),
      title: const Text("Step 1"),
      content: Column(
        children: [
          ElevatedButton(
            onPressed: () => controller.pickImagesRadiographs(),
            style: ElevatedButton.styleFrom(
              foregroundColor: Palette.background,
              backgroundColor: Palette.primary,
            ),
            child: const Text('Add Radiographs'),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 75,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.imageListRadiographs.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.file(
                        File(controller.imageListRadiographs[index].path),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      ),
                      InkWell(
                        onTap: () {
                          controller.removeNodeRadiographs(index);
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: const Icon(Icons.close,
                              size: 12, color: Palette.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
            ),
          ),
        ],
      ),
      isActive: controller.currentStep.value >= 0,
      state: controller.currentStep.value > 0
          ? StepState.complete
          : StepState.indexed,
    );
  }

  Step _stepTow() {
    return Step(
      title: const Text("Step 2"),
      subtitle: const Text("Diseases"),
      content: Obx(
        () => SizedBox(
          width: double.infinity,
          height: 175,
          child: Scrollbar(
            thumbVisibility: true,
            controller: scollBarController,
            thickness: 2.2,
            radius: const Radius.circular(10),
            child: ListView.builder(
              controller: scollBarController,
              itemCount: controller.selectedIndex.length,
              itemBuilder: (context, index) => CheckboxListTile(
                activeColor: Palette.primary,
                title: Text(controller.checkBox[index]),
                onChanged: (bool? value) {
                  controller.toggleCheckbox(index, value);
                },
                value: controller.selectedIndex[index],
              ),
            ),
          ),
        ),
      ),
      isActive: controller.currentStep.value >= 1,
      state: controller.currentStep.value > 1
          ? StepState.complete
          : StepState.indexed,
    );
  }

  Step _stepThree(BuildContext context) {
    return Step(
      title: const Text("Step 3"),
      subtitle: const Text("Medicines"),
      content: Column(
        children: [
          ElevatedButton(
            onPressed: () => controller.addMedicines(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: Palette.background,
              backgroundColor: Palette.primary,
            ),
            child: const Text('Add Medicines'),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.imageListMedicines.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.file(
                            File(controller.imageListMedicines[index].image.path),
                            fit: BoxFit.cover,
                            height: 75,
                            width: 80,
                          ),
                          Text(controller.imageListMedicines[index].name)
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          controller.removeNodeMedicines(index);
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: const Icon(Icons.close,
                              size: 12, color: Palette.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
            ),
          ),
        ],
      ),
      isActive: controller.currentStep.value == 2,
      state: controller.currentStep.value > 2
          ? StepState.complete
          : StepState.indexed,
    );
  }
}
