import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/common/home/controller/home_controller.dart';

class RequiredMaterials extends StatelessWidget {
  RequiredMaterials({super.key});
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Required Materials"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Obx(
            () => Column(
              children: [
                Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Rubber bowl",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      InkWell(
                        onTap: () {
                          if (_controller.selectedMaterila.value == index) {
                            _controller.selectedMaterila.value = -1;
                          } else {
                            _controller.selectedMaterila.value = index;
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: 55,
                          decoration: const BoxDecoration(
                              color: Palette.primaryDark,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: Icon(
                            _controller.selectedMaterila == index
                                ? Icons.remove
                                : Icons.add,
                            color: Palette.background,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (_controller.selectedMaterila == index)
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 20),
      ),
    );
  }
}
