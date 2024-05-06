import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/common/home/home.dart';

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
                  Image.asset('assets/images/Appoitment.png'),
                  Image.asset('assets/images/Capture.png'),
                  Image.asset('assets/images/profile.png'),
                  Image.asset('assets/images/Frame.png'),
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
        context.push(Routes.booking_appointment.path);
        break;
      case 2:
        context.push(Routes.record_of_visits.path);
        break;
      case 3:
        context.push(Routes.my_appointment.path);
        break;
      case 4:
        context.push(Routes.required_materials.path);
        break;
      case 5:
        context.push(Routes.test_results.path);
        break;

      default:
    }
  }
}
