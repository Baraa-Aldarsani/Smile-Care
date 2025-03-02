import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController _controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Images.logoAuth),
        ),
        title: const Text("Profile"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 3,
                  top: MediaQuery.of(context).size.height / 30,
                ),
                child: ClipOval(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CachedNetworkImage(
                      imageUrl: '${_controller.profileData.value.image}',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: 200,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${_controller.profileData.value.firstName ?? ''} ${_controller.profileData.value.lastName ?? ''}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).extension<EXTColors>()!.black),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  _controller.profileData.value.email ?? '',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  _controller.profileData.value.birthday.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  _controller.profileData.value.gender.toString(),
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
                  Get.to(EditProfileScreen(
                      profileModel: _controller.profileData.value));
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
                  _controller.logout();
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
