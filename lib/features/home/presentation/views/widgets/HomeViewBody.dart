import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/AdaptiveLayout.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/desktopLayout.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/mobileLayout.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => MobileLayout(selectedIndex: selectedIndex),
      desktopLayout: (context) => DesktopLayout(selectedIndex: selectedIndex),
    );
  }
}
