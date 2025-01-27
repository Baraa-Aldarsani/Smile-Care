// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';
import '../../../core/core.dart';

class HealthRecordScreen extends StatelessWidget {
  HealthRecordScreen({super.key});
  final StepperController step = Get.put(StepperController());
  ScrollController scollBarController = ScrollController();
  final PageController radiographController =
      PageController(viewportFraction: 0.8);
  final PageController medicineController =
      PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.background,
          title: const Text("Health Record"),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Images.logoAuth),
          ),
        ),
        body: GetBuilder(
          init: StepperController(),
          builder: (controller) => FutureBuilder(
            future: controller.getHealthRecordData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: Palette.primary,
                        ),
                  ),
                  child: Obx(
                    () => Stepper(
                      currentStep: controller.currentStep.value,
                      onStepContinue: controller.currentStep < 2
                          ? controller.stepContinue
                          : controller.showAlertDialog,
                      onStepCancel: controller.stepCancel,
                      steps: <Step>[
                        _stepOne(),
                        _stepTwo(),
                        _stepThree(context),
                      ],
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.healthRecord.radiographs!.isNotEmpty)
                        buildSectionTitle(context, 'Radiographs'),
                      if (controller.healthRecord.radiographs!.isNotEmpty)
                        buildAnimatedListRad(
                            controller.healthRecord.radiographs!,
                            radiographController),
                      if (controller.healthRecord.medicine!.isNotEmpty)
                        buildSectionTitle(context, 'Medicines'),
                      if (controller.healthRecord.medicine!.isNotEmpty)
                        buildAnimatedListMed(controller.healthRecord.medicine!,
                            medicineController),
                      if (controller.healthRecord.diseases!.isNotEmpty)
                        buildSectionTitle(context, 'Diseases'),
                      if (controller.healthRecord.diseases!.isNotEmpty)
                        buildDiseaseContainer(
                            controller.healthRecord.diseases!),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }

  Step _stepOne() {
    return Step(
      subtitle: const Text("Radiographs section"),
      title: const Text("Step 1"),
      content: Column(
        children: [
          ElevatedButton(
            onPressed: () => step.pickImagesRadiographs(),
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
              itemCount: step.imageListRadiographs.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.file(
                        File(step.imageListRadiographs[index].path),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      ),
                      InkWell(
                        onTap: () {
                          step.removeNodeRadiographs(index);
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
      isActive: step.currentStep.value >= 0,
      state:
          step.currentStep.value > 0 ? StepState.complete : StepState.indexed,
    );
  }

  Step _stepTwo() {
    return Step(
      title: const Text("Step 2"),
      subtitle: const Text("Diseases section"),
      content: SizedBox(
        width: double.infinity,
        height: 175,
        child: Scrollbar(
          thumbVisibility: true,
          controller: scollBarController,
          thickness: 2.2,
          radius: const Radius.circular(10),
          child: ListView.builder(
            controller: scollBarController,
            itemCount: step.selectedIndex.length,
            itemBuilder: (context, index) => CheckboxListTile(
              activeColor: Palette.primary,
              title: Text(step.viewDiseases[index].name),
              onChanged: (bool? value) {
                step.toggleCheckbox(index, value);
              },
              value: step.selectedIndex[index],
            ),
          ),
        ),
      ),
      isActive: step.currentStep.value >= 1,
      state:
          step.currentStep.value > 1 ? StepState.complete : StepState.indexed,
    );
  }

  Step _stepThree(BuildContext context) {
    return Step(
      title: const Text("Step 3"),
      subtitle: const Text("Medicines section"),
      content: Column(
        children: [
          ElevatedButton(
            onPressed: () => step.addMedicines(context),
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
              itemCount: step.imageListMedicines.length,
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
                            File(step.imageListMedicines[index].image.path),
                            fit: BoxFit.cover,
                            height: 75,
                            width: 80,
                          ),
                          Text(step.imageListMedicines[index].name)
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          step.removeNodeMedicines(index);
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
      isActive: step.currentStep.value == 2,
      state:
          step.currentStep.value > 2 ? StepState.complete : StepState.indexed,
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildAnimatedListRad(
      List<RadiographsModel> items, PageController controller,
      {bool isMedicine = false}) {
    return SizedBox(
      height: 178,
      child: PageView.builder(
        controller: controller,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double scale = 1.0;
              if (controller.position.haveDimensions) {
                double pageOffset = controller.page! - index;
                scale = (1 - (pageOffset.abs() * 0.3)).clamp(0.8, 1.0);
              }
              return Transform.scale(
                scale: scale,
                child: SizedBox(
                  height: 150,
                  width: 310,
                  child: child,
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              elevation: 4,
              child: Image.network(items[index].image, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget buildAnimatedListMed(
    List<GetMedicineModel> items,
    PageController controller,
  ) {
    return SizedBox(
      height: 178,
      child: PageView.builder(
        controller: controller,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double scale = 1.0;
              if (controller.position.haveDimensions) {
                double pageOffset = controller.page! - index;
                scale = (1 - (pageOffset.abs() * 0.3)).clamp(0.8, 1.0);
              }
              return Transform.scale(
                scale: scale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 310,
                      child: child,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(items[index].name,
                          style: const TextStyle(fontSize: 14)),
                    )
                  ],
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10),
              elevation: 4,
              child: Image.network(items[index].image, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget buildDiseaseContainer(List<DiseasesModel> diseases) {
    return Wrap(
      children: diseases
          .map((disease) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(disease.name, style: const TextStyle(fontSize: 18)),
              ))
          .toList(),
    );
  }
}







//////////////////////
///
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smile_care/feautre/health_record/health_record.dart';
// import '../../../core/core.dart';

// class HealthRecordScreen extends StatelessWidget {
//   HealthRecordScreen({super.key});
//   final StepperController controller = Get.put(StepperController());
//   ScrollController scollBarController = ScrollController();
//   final PageController radiographController =
//       PageController(viewportFraction: 0.8);
//   final PageController medicineController =
//       PageController(viewportFraction: 0.8);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Palette.background,
//           title: const Text("Health Record"),
//           titleTextStyle: Theme.of(context).textTheme.headlineSmall,
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(Images.logoAuth),
//           ),
//         ),
//         body: FutureBuilder(
//           future: controller.getHealthRecordData(),
//           builder: (context, snapshot) {
//             return Obx(() {
//               if (controller.isLoading.isTrue) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Theme(
//                   data: Theme.of(context).copyWith(
//                     colorScheme: Theme.of(context).colorScheme.copyWith(
//                           primary: Palette.primary,
//                         ),
//                   ),
//                   child: Stepper(
//                     currentStep: controller.currentStep.value,
//                     onStepContinue: controller.currentStep < 2
//                         ? controller.stepContinue
//                         : controller.showAlertDialog,
//                     onStepCancel: controller.stepCancel,
//                     steps: <Step>[
//                       _stepOne(),
//                       _stepTwo(),
//                       _stepThree(context),
//                     ],
//                   ),
//                 );
//               } else {
//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildSectionTitle(context, 'Radiographs'),
//                       buildAnimatedListRad(controller.healthRecord.radiographs!,
//                           radiographController),
//                       buildSectionTitle(context, 'Medicines'),
//                       buildAnimatedListMed(
//                           controller.healthRecord.medicine!, medicineController,
//                           isMedicine: true),
//                       buildSectionTitle(context, 'Diseases'),
//                       buildDiseaseContainer(controller.healthRecord.diseases!),
//                     ],
//                   ),
//                 );
//               }
//             });
//           },
//         ));
//   }

//   Step _stepOne() {
//     return Step(
//       subtitle: const Text("Radiographs section"),
//       title: const Text("Step 1"),
//       content: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () => controller.pickImagesRadiographs(),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Palette.background,
//               backgroundColor: Palette.primary,
//             ),
//             child: const Text('Add Radiographs'),
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: 75,
//             width: double.infinity,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: controller.imageListRadiographs.length,
//               itemBuilder: (context, index) {
//                 return ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   child: Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Image.file(
//                         File(controller.imageListRadiographs[index].path),
//                         fit: BoxFit.cover,
//                         height: 75,
//                         width: 75,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           controller.removeNodeRadiographs(index);
//                         },
//                         child: Container(
//                           width: 12,
//                           height: 12,
//                           margin: const EdgeInsets.all(3),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(25)),
//                           ),
//                           child: const Icon(Icons.close,
//                               size: 12, color: Palette.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const SizedBox(width: 10),
//             ),
//           ),
//         ],
//       ),
//       isActive: controller.currentStep.value >= 0,
//       state: controller.currentStep.value > 0
//           ? StepState.complete
//           : StepState.indexed,
//     );
//   }

//   Step _stepTwo() {
//     return Step(
//       title: const Text("Step 2"),
//       subtitle: const Text("Diseases section"),
//       content: SizedBox(
//         width: double.infinity,
//         height: 175,
//         child: Scrollbar(
//           thumbVisibility: true,
//           controller: scollBarController,
//           thickness: 2.2,
//           radius: const Radius.circular(10),
//           child: ListView.builder(
//             controller: scollBarController,
//             itemCount: controller.selectedIndex.length,
//             itemBuilder: (context, index) => CheckboxListTile(
//               activeColor: Palette.primary,
//               title: Text(controller.viewDiseases[index].name),
//               onChanged: (bool? value) {
//                 controller.toggleCheckbox(index, value);
//               },
//               value: controller.selectedIndex[index],
//             ),
//           ),
//         ),
//       ),
//       isActive: controller.currentStep.value >= 1,
//       state: controller.currentStep.value > 1
//           ? StepState.complete
//           : StepState.indexed,
//     );
//   }

//   Step _stepThree(BuildContext context) {
//     return Step(
//       title: const Text("Step 3"),
//       subtitle: const Text("Medicines section"),
//       content: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () => controller.addMedicines(context),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Palette.background,
//               backgroundColor: Palette.primary,
//             ),
//             child: const Text('Add Medicines'),
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: 100,
//             width: double.infinity,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: controller.imageListMedicines.length,
//               itemBuilder: (context, index) {
//                 return ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   child: Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Image.file(
//                             File(controller
//                                 .imageListMedicines[index].image.path),
//                             fit: BoxFit.cover,
//                             height: 75,
//                             width: 80,
//                           ),
//                           Text(controller.imageListMedicines[index].name)
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {
//                           controller.removeNodeMedicines(index);
//                         },
//                         child: Container(
//                           width: 12,
//                           height: 12,
//                           margin: const EdgeInsets.all(3),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(25)),
//                           ),
//                           child: const Icon(Icons.close,
//                               size: 12, color: Palette.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const SizedBox(width: 10),
//             ),
//           ),
//         ],
//       ),
//       isActive: controller.currentStep.value == 2,
//       state: controller.currentStep.value > 2
//           ? StepState.complete
//           : StepState.indexed,
//     );
//   }

//   Widget buildSectionTitle(BuildContext context, String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//       child: Text(title, style: Theme.of(context).textTheme.headline6),
//     );
//   }

//   Widget buildAnimatedListRad(
//       List<RadiographsModel> items, PageController controller,
//       {bool isMedicine = false}) {
//     return SizedBox(
//       height: 178,
//       child: PageView.builder(
//         controller: controller,
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: controller,
//             builder: (context, child) {
//               double scale = 1.0;
//               if (controller.position.haveDimensions) {
//                 double pageOffset = controller.page! - index;
//                 scale = (1 - (pageOffset.abs() * 0.3)).clamp(0.8, 1.0);
//               }
//               return Transform.scale(
//                 scale: scale,
//                 child: SizedBox(
//                   height: 150,
//                   width: 310,
//                   child: child,
//                 ),
//               );
//             },
//             child: Card(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               elevation: 4,
//               child: Image.network(items[index].image, fit: BoxFit.cover),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget buildAnimatedListMed(
//       List<GetMedicineModel> items, PageController controller,
//       {bool isMedicine = false}) {
//     return SizedBox(
//       height: 178,
//       child: PageView.builder(
//         controller: controller,
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: controller,
//             builder: (context, child) {
//               double scale = 1.0;
//               if (controller.position.haveDimensions) {
//                 double pageOffset = controller.page! - index;
//                 scale = (1 - (pageOffset.abs() * 0.3)).clamp(0.8, 1.0);
//               }
//               return Transform.scale(
//                 scale: scale,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       height: 150,
//                       width: 310,
//                       child: child,
//                     ),
//                     if (isMedicine)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Text(items[index].name,
//                             style: const TextStyle(fontSize: 14)),
//                       )
//                   ],
//                 ),
//               );
//             },
//             child: Card(
//               margin: const EdgeInsets.symmetric(
//                   horizontal: 10), // تقليل المسافة الأفقية
//               elevation: 4,
//               child: Image.network(items[index].image, fit: BoxFit.cover),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget buildDiseaseContainer(List<DiseasesModel> diseases) {
//     return Wrap(
//       children: diseases
//           .map((disease) => Container(
//                 margin: const EdgeInsets.all(8),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.lightBlue[100],
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Text(disease.name, style: const TextStyle(fontSize: 18)),
//               ))
//           .toList(),
//     );
//   }
// }
