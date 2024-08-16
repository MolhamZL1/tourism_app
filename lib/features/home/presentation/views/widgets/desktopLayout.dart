import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawer.dart';

class DesktopLayout extends StatefulWidget {
  DesktopLayout({super.key, required this.selectedIndex});
  int selectedIndex;

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomDrawer(
                destenations: destenations,
                selectedIndex: widget.selectedIndex,
                onDestinationSelected: (value) =>
                    setState(() => widget.selectedIndex = value))),
        Expanded(
          flex: 4,
          child: views[widget.selectedIndex],
        ),
      ],
    );
  }
}
