import 'package:flutter/material.dart';

class TravelDashBoardText extends StatelessWidget {
  const TravelDashBoardText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Text("Travel Dashboard", style: TextStyle(fontSize: 24)),
    );
  }
}
