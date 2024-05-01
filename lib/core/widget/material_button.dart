import 'package:flutter/material.dart';

class MaterialBtn extends StatelessWidget {
  const MaterialBtn({
    super.key,
    required this.icon,
    required this.title,
    this.colorIcon = Colors.black45,
    this.colorText = Colors.black45,
    required this.onPressed,
  });
  final IconData icon;
  final String title;
  final Color colorIcon;
  final Color colorText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      splashColor: Colors.white,
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Icon(icon, size: 25, color: colorIcon),
          const SizedBox(width: 30),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorText,
                ),
          )
        ],
      ),
    );
  }
}
