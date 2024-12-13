import 'package:ecommerce_app/features/admin/data/repos/products_repo.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_admin_product_item.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminProductsListView extends StatelessWidget {
  const AdminProductsListView({
    super.key,
    required this.catID,
  });
  final String catID;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt<ProductsRepo>().getCategoryProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer.sliver(
                child: SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const DummyAdminProductItem(),
            ));
          } else {
            var items = snapshot.data?.docs
                    .map((e) => ProductModel.fromFirestoreDoc(e))
                    .toList()
                    .where((productItem) {
                  return productItem.catID == catID;
                }).toList() ??
                [];
            return SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CustomAdminProductItem(
                item: items[index],
              ),
            );
          }
        });
  }
}
