import 'package:ecommerce_app/features/admin/presentation/views/best_selling_view.dart';
import 'package:ecommerce_app/features/admin/presentation/views/transaction_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/home/data/models/drawer_item_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/drawer_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/user_info_list_tile.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});
  static List<DrawerItemModel> items = [
    DrawerItemModel(
      icon: Icons.credit_card,
      title: "Transactions",
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TransactionView(),
          ),
        );
      },
    ),
    DrawerItemModel(
      icon: Icons.star,
      title: "Best Sellings",
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BestSellingView(),
          ),
        );
      },
    ),
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
      },
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
