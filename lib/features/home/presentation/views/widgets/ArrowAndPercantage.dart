import 'package:flutter/material.dart';

class ArrowAndPercantage extends StatelessWidget {
  const ArrowAndPercantage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.north_east, size: 18, color: Colors.green),
        Text("8%", style: TextStyle(fontSize: 11)),
      ],
    );
  }
}
