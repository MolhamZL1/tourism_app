import 'package:flutter/material.dart';

class CustomRowCard extends StatelessWidget {
  const CustomRowCard({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: iconColor,
      ),
      const SizedBox(width: 4),
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
