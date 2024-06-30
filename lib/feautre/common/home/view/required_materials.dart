import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

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
        itemCount: _controller.requiredMaterial.length,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _controller.requiredMaterial[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                            ),
                            Text(
                                "${_controller.requiredMaterial[index].studentFName} ${_controller.requiredMaterial[index].studentLName}")
                          ],
                        ),
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
                    child: CachedNetworkImage(
                      imageUrl: _controller.requiredMaterial[index].image,
                      httpHeaders: {
                        'X-Token': 'Bearer $tokens()',
                        'Authorization': basicAuth
                      },
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Palette.grey,
                        highlightColor: Palette.primaryLight,
                        child: Container(
                          height: 62,
                          decoration: const BoxDecoration(
                            color: Palette.primaryLight,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Shimmer.fromColors(
                        baseColor: Palette.grey,
                        highlightColor: Palette.primaryLight,
                        child: Container(
                          height: 62,
                          decoration: const BoxDecoration(
                            color: Palette.primaryLight,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      fit: BoxFit.fill,
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
