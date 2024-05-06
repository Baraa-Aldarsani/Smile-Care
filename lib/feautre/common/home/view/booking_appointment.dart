import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class BookingAppointment extends StatelessWidget {
  const BookingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Booking Appointment"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Center(
        child: Text("Booking Appointment"),
      ),
    );
  }
}
