import 'package:flutter/material.dart';
import 'package:tourism_app/core/models/draweritemmodel.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.drawerItemModel,
    this.selected = false,
  });
  final DrawerItemModel drawerItemModel;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedColor: Colors.white,
      selectedTileColor: kColor,
      leading: Icon(drawerItemModel.icon),
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              drawerItemModel.text,
            )),
      ),
    );
  }
}
