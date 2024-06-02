import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class BookingAppointment extends StatelessWidget {
  BookingAppointment({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Booking Appointment"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _controller.reason,
                cursorColor: Palette.primary,
                decoration: const InputDecoration(
                  labelText: 'Reasons for booking an appointment',
                  border: OutlineInputBorder(),
                  hintText: 'Write something reason...',
                  labelStyle: TextStyle(color: Palette.primary),
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some reason';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedBtn(
                    title: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _controller.bookAppointment(context);
                      }
                    },
                    width: 160,
                    height: 50,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
