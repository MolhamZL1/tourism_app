import 'package:flutter/material.dart';
import 'package:tourism_app/core/models/draweritemmodel.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawerItem.dart';

class CustomDrawerList extends StatelessWidget {
  const CustomDrawerList({
    super.key,
    @required this.onDestinationSelected,
    @required this.selectedIndex,
    required this.destenations,
  });
  final ValueChanged<int>? onDestinationSelected;
  final int? selectedIndex;
  final List<DrawerItemModel> destenations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: destenations.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
          onTap: _handleTap(index),
          child: CustomDrawerItem(
            selected: selectedIndex == index,
            drawerItemModel: destenations[index],
          )),
    );
  }

  VoidCallback _handleTap(int index) {
    return onDestinationSelected != null
        ? () => onDestinationSelected!(index)
        : () {};
  }
}
