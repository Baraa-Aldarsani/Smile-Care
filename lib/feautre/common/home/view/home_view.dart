import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/common/home/home.dart';
import 'package:smile_care/feautre/common/home/view/my_appointment.dart';
import 'package:smile_care/feautre/common/home/view/record_of_visits.dart';
import 'package:smile_care/feautre/common/home/view/required_materials.dart';
import 'package:smile_care/feautre/common/home/view/test_results.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());
  final ImageSliderController controllerSlider =
      Get.put(ImageSliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primary,
          title: const Text('Home Screen'),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).extension<EXTColors>()!.background,
              ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(Images.listMenue, scale: 0.8),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/Capture.png"),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black,
              height: 150,
              child: PageView(
                controller: controllerSlider.pageController,
                children: <Widget>[
                  for (int i = 0; i < Images.slider.length; i++)
                    Image.asset(Images.slider[i], fit: BoxFit.cover),
                ],
              ),
            ),
            Container(
              height: 40.h,
              alignment: Alignment.center,
              color: Palette.orgCard,
              child: Text(
                "Damascus University",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color:
                          Theme.of(context).extension<EXTColors>()!.background,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            navigateTo(index + 1, context);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Palette.primary,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Image.asset(Images.image[index],
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          controller.title[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }

  navigateTo(int index, BuildContext context) {
    switch (index) {
      case 1:
        Get.to(BookingAppointment());
        break;
      case 2:
        Get.to(RecordOfVisits());
        break;
      case 3:
        Get.to(MyAppointment());
        break;
      case 4:
        Get.to(RequiredMaterials());
        break;

      case 5:
        Get.to(TestResults());
        break;

      default:
    }
  }
}
