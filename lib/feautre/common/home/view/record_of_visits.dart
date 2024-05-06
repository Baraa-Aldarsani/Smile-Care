import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class RecordOfVisits extends StatelessWidget {
  const RecordOfVisits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Palette.background,
        
        title: const Text("Record Of Visits"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Center(
        child: Text("Record Of Visits"),
      ),
    );
  }
}