import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class TestResults extends StatelessWidget {
  const TestResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Test Results"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Center(
        child: Text("Test Results"),
      ),
    );
  }
}
