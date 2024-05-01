import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                      children: [
                        Container(
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
                        const SizedBox(height: 4),
                        Text(
                          'Item $index',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
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
}
