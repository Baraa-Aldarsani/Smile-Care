// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/profile/profile.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key, required this.profileModel});
  ProfileModel profileModel;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileController _controller = Get.put(EditProfileController());
  final ProfileController _controllerPP = Get.put(ProfileController());

  final TextEditingController firstName = TextEditingController();

  final TextEditingController lastName = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstName.text = widget.profileModel.firstName!;
    lastName.text = widget.profileModel.lastName!;
    _controller.dateController.text = widget.profileModel.birthday!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Edit Profile"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 3.5,
                        top: MediaQuery.of(context).size.height / 68,
                      ),
                      child: ClipOval(
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: _controller.image == null
                              ? CachedNetworkImage(
                                  imageUrl: '${widget.profileModel.image}',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: double.infinity,
                                )
                              : Image.file(
                                  File(_controller.image!.path),
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
                            _controller.selectImage(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: firstName,
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: lastName,
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                title: _controller.dateController.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please select your date of birthday';
                  }
                },
                readOnly: true,
                icon: Icons.date_range,
                onTap: () => _controller.selectDate(context),
                controller: _controller.dateController,
              ),
              const SizedBox(height: 30),
              selectGender(context),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: ElevatedBtn(
                  title: "Update",
                  onPressed: handleUpdate,
                  width: 180,
                  height: 45,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container selectGender(
    BuildContext context,
  ) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
          color: Palette.primaryLight,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: PopupMenuButton<int>(
        itemBuilder: (BuildContext context) {
          return List.generate(
            _controller.gender.length,
            (index) {
              return PopupMenuItem(
                value: index,
                child: Text(_controller.gender[index]),
                onTap: () {
                  _controller.selectedGender.value = index;
                },
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.gesture_outlined, color: Colors.black87),
                  const SizedBox(width: 12),
                  Text(
                    _controller.selectedGender.value == -1
                        ? widget.profileModel.gender!
                        : _controller.gender[_controller.selectedGender.value],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Future<void> handleUpdate() async {
    widget.profileModel.firstName = firstName.text;
    widget.profileModel.lastName = lastName.text;
    widget.profileModel.birthday = _controller.dateController.text;
    widget.profileModel.gender = _controller.selectedGender.value == -1
        ? widget.profileModel.gender!
        : _controller.gender[_controller.selectedGender.value].toLowerCase();
    File? imageFile;
    if (_controller.image != null) {
      imageFile = _controller.image;
    } else if (widget.profileModel.image != null &&
        !Uri.tryParse(widget.profileModel.image.toString())!.isAbsolute) {
      imageFile = File(widget.profileModel.image.toString());
    }

    if (imageFile != null) {
      await _controller.updateUserInfo(widget.profileModel, imageFile);
      _controllerPP.fetchUser();
    } else {
      await _controller.updateUserInfo(widget.profileModel, null);
      _controllerPP.fetchUser();
    }
  }
}
