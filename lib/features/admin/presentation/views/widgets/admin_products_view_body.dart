import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_products_list_view.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_admin_search_field.dart';
import 'package:flutter/material.dart';

class AdminProductsViewBody extends StatelessWidget {
  const AdminProductsViewBody(
      {super.key, required this.categoryID, required this.categoryName});
  final String categoryID;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const CustomAdminSearchField(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            AdminProductsListView(
              catID: categoryID,
            ),
          ],
        ),
      ),
    );
  }
}
