import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomErrorDialog extends StatelessWidget {
  const CustomErrorDialog({
    super.key,
    required this.errMessage,
  });
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Error",
            style: TextStyle(fontSize: 24, color: Colors.red)),
        content: SizedBox(
            height: 200,
            width: 300,
            child: Column(
              children: [
                Image.asset("images/error.jpg"),
                Text(errMessage,
                    style: const TextStyle(fontSize: 24, color: Colors.red)),
              ],
            )),
        actions: [
          TextButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text(
                "Cancle",
                style: TextStyle(color: Colors.black),
              )),
        ]);
  }
}
