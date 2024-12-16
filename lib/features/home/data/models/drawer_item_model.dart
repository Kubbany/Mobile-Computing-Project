import 'package:flutter/material.dart';

class DrawerItemModel {
  final IconData icon;
  final String title;
  final void Function(BuildContext context) onTap;
  const DrawerItemModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
