import 'package:ecommerce_app/features/admin/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_category_item.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminCategoryGridView extends StatelessWidget {
  const AdminCategoryGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt<CategoriesRepo>().getAllCategories(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: const DummyAdminCategoryItem(),
                ),
              ),
            );
          } else {
            var items = data.data?.docs
                    .map(
                      (e) => CategoryItemModel.fromMap(
                        e.data(),
                      ),
                    )
                    .toList() ??
                [];
            return GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 50,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: AdminCategoryItem(
                  item: items[index],
                ),
              ),
            );
          }
        });
  }
}
