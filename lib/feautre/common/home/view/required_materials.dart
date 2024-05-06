import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class RequiredMaterials extends StatelessWidget {
  const RequiredMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        
        title: const Text("Required Materials"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Center(
        child: Text("Required Materials"),
      ),
    );
  }
}
