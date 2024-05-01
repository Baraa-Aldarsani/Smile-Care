import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final Color fillcolor;
  final bool isSelected;

  const ColorDot({
    Key? key,
    required this.fillcolor,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(6),
      height: 20,
      width: 20,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? fillcolor : Colors.white),
      ),
    );
  }
}
