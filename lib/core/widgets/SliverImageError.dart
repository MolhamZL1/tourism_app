import 'package:flutter/material.dart';

class SliverImageError extends StatelessWidget {
  const SliverImageError({
    super.key,
    required this.errMessage,
  });
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("images/error.png"),
        Text(
          errMessage,
          style: const TextStyle(color: Colors.red, fontSize: 24),
        ),
      ],
    ));
  }
}
