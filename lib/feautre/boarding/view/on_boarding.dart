import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_care/core/core.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/logo.png"),
            Text(
              "Welcome to the Department of Dentistry at Damascus University",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Join us to be a part of this distinguished scientific journey, as we always strive to raise the level of education and scientific research, and work side by side for better health of society",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ElevatedBtn(
              height: 45.h,
              width: 250.w,
              onPressed: () {
                context.go(Routes.signIn.path);
              },
              title: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
