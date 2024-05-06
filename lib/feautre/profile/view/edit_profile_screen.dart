import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/profile/profile.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _controller = Get.put(EditProfileController());
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
            children: [
              CustomTextField(
                title: "Baraa",
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                title: "Aldarsani",
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                title: "Date of Birth",
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
              CustomTextField(
                title: "baraa.aldarsani@gmail.com",
                icon: Icons.email,
              ),
              const SizedBox(height: 30),
              selectCity(context),
              const SizedBox(height: 30),
              selectGender(context),
              const SizedBox(height: 50),
              ElevatedBtn(
                title: "Update",
                onPressed: () {},
                width: 180,
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container selectCity(BuildContext context) {
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
            _controller.city.length,
            (index) {
              return PopupMenuItem(
                value: index,
                child: Text(_controller.city[index]),
                onTap: () {
                  _controller.selectedCity.value = index;
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
                  const Icon(Icons.location_city, color: Colors.black87),
                  const SizedBox(width: 12),
                  Text(
                    _controller.selectedCity.value == -1
                        ? "City"
                        : _controller.city[_controller.selectedCity.value],
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

  Container selectGender(BuildContext context) {
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
                        ? "Gender"
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
}
