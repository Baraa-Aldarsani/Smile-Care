import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/Capture.png"),
        ),
        title: const Text("Profile"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3,
                      top: MediaQuery.of(context).size.height / 20,
                    ),
                    child: ClipOval(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: controller.image == null
                            ? Container(
                                color: const Color(0xFFE7E7E7),
                              )
                            : Image.file(
                                File(controller.image!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: InkWell(
                        child: const Icon(Icons.edit),
                        onTap: () {
                          controller.selectImage(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Baraa Aldarsani",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).extension<EXTColors>()!.black),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "baraa.aldarsani@gmail.com",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            const Divider(
              thickness: 0.8,
              indent: 30,
              endIndent: 30,
            ),
            MaterialBtn(
              title: "Edit Profile",
              icon: Icons.edit,
              onPressed: () {
                Get.to(EditProfileScreen());
              },
            ),
            MaterialBtn(
              title: "Notification",
              icon: Icons.notification_important_rounded,
              onPressed: () {},
            ),
            MaterialBtn(
              title: "Security",
              icon: Icons.security,
              onPressed: () {},
            ),
            MaterialBtn(
              title: "Help",
              icon: Icons.help,
              onPressed: () {},
            ),
            MaterialBtn(
              title: "About",
              icon: Icons.adobe_outlined,
              onPressed: () {},
            ),
            MaterialBtn(
              title: "Logout",
              icon: Icons.logout,
              colorIcon: Palette.red,
              colorText: Palette.red,
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
