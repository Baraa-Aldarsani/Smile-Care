// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class PatientSessions extends StatelessWidget {
  final SessionController _controller = Get.put(SessionController());
  PatientSessions({super.key});
  // List person = [
  //   {
  //     "name": "Maria",
  //     "job": "Dentist",
  //     "description": "Service Description ",
  //     "onLine": "open",
  //   },
  //   {
  //     "name": "Dana",
  //     "job": "Dentist",
  //     "description": "Service Description ",
  //     "onLine": "close",
  //   },
  //   {
  //     "name": "Baraa",
  //     "job": "ITE",
  //     "description": "Service Description ",
  //     "onLine": "open",
  //   },
  //   {
  //     "name": "Baraa",
  //     "job": "ITE",
  //     "description": "Service Description ",
  //     "onLine": "open",
  //   },
  //   {
  //     "name": "Baraa",
  //     "job": "ITE",
  //     "description": "Service Description ",
  //     "onLine": "open",
  //   },
  //   {
  //     "name": "Baraa",
  //     "job": "ITE",
  //     "description": "Service Description ",
  //     "onLine": "open",
  //   },
  // ];
  List<Color> colors = [
    Colors.white,
    Palette.primary,
    Palette.grey,
    Colors.white,
    Palette.primary,
    Palette.grey,
    Colors.white,
    Palette.primary,
    Palette.grey,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Patient Sessions"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: ListView.builder(
        itemCount: _controller.sessionInfo.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(SessionSummary(
              sessionInfo: _controller.sessionInfo[index],
            ));
            _controller.fetchSessionInfo(1);
          },
          child: Container(
            color: index + 1 < colors.length
                ? colors[index + 1]
                : Colors.transparent,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 300)),
                color: colors[index],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          border:
                              Border.all(width: 0.4, color: Palette.primary),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          child: Container(
                            alignment: Alignment.center,
                            color: Palette.primaryDark,
                            child: Text(
                              "${index + 1}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .extension<EXTColors>()!
                                        .background,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${_controller.sessionInfo[index].supervisorModel.firstName} ${_controller.sessionInfo[index].supervisorModel.lastName}"),
                          Text(_controller.sessionInfo[index].clinicModel
                              .sectionModel.name),
                          Text(_controller.sessionInfo[index]
                              .detailsSessionModel.statusOfSession),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const ColorDot(
                                    fillcolor: Color.fromRGBO(176, 185, 67, 1),
                                    isSelected: true,
                                  ),
                                  Text(
                                    _controller.sessionInfo[index]
                                        .detailsSessionModel.statusOfSession,
                                  ),
                                ],
                              ),
                              Text(
                                  "Evaluation : ${_controller.sessionInfo[index].detailsSessionModel.evaluation.toString()}"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
