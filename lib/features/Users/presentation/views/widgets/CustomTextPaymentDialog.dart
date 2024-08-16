import 'package:flutter/material.dart';

class CustomTextPaymentDialog extends StatelessWidget {
  const CustomTextPaymentDialog({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
