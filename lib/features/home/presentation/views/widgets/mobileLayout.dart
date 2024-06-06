import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return views[selectedIndex];
  }
}
