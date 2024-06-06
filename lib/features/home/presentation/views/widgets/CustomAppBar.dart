import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 900
        ? AppBar(
            backgroundColor: kColor,
            leading: IconButton(
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          )
        : const SizedBox();
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
