import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      child: ListTile(
        leading: Icon(Icons.abc),
        title: Text('Clique aqui'),
      ),
    );
  }
}
