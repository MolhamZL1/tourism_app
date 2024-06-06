import 'package:flutter/material.dart';

class CustomCircleLoading extends StatelessWidget {
  const CustomCircleLoading({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
    ));
  }
}
