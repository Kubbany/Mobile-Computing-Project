import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_drawer.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_view_body.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_add_button.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});
  static const String id = kAdminView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomAddButton(
        heroTag: "AddCategory",
        onPressed: () {},
      ),
      drawer: const AdminDrawer(),
      body: const AdminViewBody(),
    );
  }
}
