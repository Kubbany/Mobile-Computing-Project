import 'package:ecommerce_app/features/home/data/models/drawer_item_model.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemModel,
  });
  final DrawerItemModel drawerItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        drawerItemModel.icon,
        size: 30,
      ),
      title: Text(
        drawerItemModel.title,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
