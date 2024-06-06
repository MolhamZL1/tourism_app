import 'package:flutter/material.dart';

class TopSellingToursText extends StatelessWidget {
  const TopSellingToursText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Text("Top Selling Tours", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
