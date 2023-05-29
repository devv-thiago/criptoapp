import 'package:flutter/material.dart';
import 'package:login/components/widgets/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.topCenter,
        child: const Column(
          children: [
            DrawerItem(),
            DrawerItem(),
            DrawerItem(),
            DrawerItem(),
          ],
        ),
      ),
    );
  }
}
