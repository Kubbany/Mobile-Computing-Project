import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_category_grid_view.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_admin_search_field.dart';
import 'package:flutter/material.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Admin",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CustomAdminSearchField(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: AdminCategoryGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
