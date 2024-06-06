import 'package:flutter/material.dart';

class GrayTitleTextForListView extends StatelessWidget {
  const GrayTitleTextForListView({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return SizedBox(
        width: width,
        child: Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey)));
  }
}
