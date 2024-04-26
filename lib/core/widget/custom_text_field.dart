import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
    required this.title,
    this.icon,
    this.validator,
    this.obscureText = false,
  });
  final String title;
  final IconData? icon;
  final dynamic validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: const BoxDecoration(
          color: Color(0xffF1FCFE),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        cursorColor: Palette.primary,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: title,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
