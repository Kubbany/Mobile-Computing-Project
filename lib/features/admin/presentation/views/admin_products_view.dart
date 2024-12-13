import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_products_view_body.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_add_button.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/product_buttom_sheet.dart';
import 'package:flutter/material.dart';

class AdminProductsView extends StatelessWidget {
  const AdminProductsView(
      {super.key, required this.categoryID, required this.categoryName});
  static const String id = kProductsView;
  final String categoryID;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomAddButton(
        heroTag: "AddProduct",
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => ProductButtomSheet(
              catID: categoryID,
            ),
          );
        },
      ),
      body: AdminProductsViewBody(
        categoryID: categoryID,
        categoryName: categoryName,
      ),
    );
  }
}
