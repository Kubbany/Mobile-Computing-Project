import 'package:ecommerce_app/features/home/data/models/drawer_item_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/drawer_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});
  static List<DrawerItemModel> items = [
    const DrawerItemModel(
      icon: Icons.credit_card,
      title: "Transactions",
    ),
    const DrawerItemModel(
      icon: Icons.feedback,
      title: "Feedbacks",
    ),
    const DrawerItemModel(
      icon: Icons.star,
      title: "Best Sellings",
    ),
    const DrawerItemModel(
      icon: Icons.logout_outlined,
      title: "Logout",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 64,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            const UserInfoListTile(
              username: "Admin",
              email: "admin@gmail.com",
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            Column(
              children: items
                  .map(
                    (e) => DrawerItem(drawerItemModel: e),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
