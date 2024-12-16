import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:ecommerce_app/features/home/data/models/drawer_item_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/drawer_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/user_info_list_tile.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key, required this.email, required this.username});
  final String email;
  final String username;
  static List<DrawerItemModel> items = [
    DrawerItemModel(
        icon: Icons.shopping_cart_outlined,
        title: "Your Cart",
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartView(),
            ),
          );
        }),
    DrawerItemModel(
        icon: Icons.logout_outlined,
        title: "Logout",
        onTap: (context) {
          FirebaseAuth.instance.signOut();
          getIt<SharedPreferences>().clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
        }),
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
            UserInfoListTile(username: username, email: email),
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
