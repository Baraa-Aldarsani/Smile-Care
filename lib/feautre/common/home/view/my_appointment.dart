import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Palette.background,
        
        title: const Text("My Appointment"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Center(
        child: Text("My Appointment"),
      ),
    );
  }
}
