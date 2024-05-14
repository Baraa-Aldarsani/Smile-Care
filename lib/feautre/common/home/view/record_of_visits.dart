import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class RecordOfVisits extends StatelessWidget {
  const RecordOfVisits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Record Of Visits"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 55,
            decoration: BoxDecoration(
              color: Palette.primaryLight,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(1.5, 1.5),
                  blurRadius: 2,
                )
              ],
            ),
            child: ListTile(
              dense: true,
              textColor: Palette.black,
              title: Text(
                "Monday",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 19,
                    ),
              ),
              subtitle: Text(
                "27/12/2020",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Text(
                "01:30 PM",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 20),
      ),
    );
  }
}
