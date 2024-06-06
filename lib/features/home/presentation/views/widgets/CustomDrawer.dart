import 'package:flutter/material.dart';
import 'package:tourism_app/core/models/draweritemmodel.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawerItem.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawerList.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/CustomLogOutDialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
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
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: kColor,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Image.asset(
                          "images/mine.jpg",
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                ],
              ),
              const Spacer(),
              Text("Molham")
            ],
          )),
          CustomDrawerList(
            destenations: destenations,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const CustomLogOutDialog());
            },
            child: CustomDrawerItem(
              drawerItemModel:
                  DrawerItemModel(text: "L O G O U T", icon: Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}
