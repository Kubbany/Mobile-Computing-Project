import 'package:ecommerce_app/features/admin/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/admin_category_item.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminCategoryGridView extends StatelessWidget {
  const AdminCategoryGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt<CategoriesRepo>().getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) => const DummyAdminCategoryItem(),
              ),
            );
          } else {
            var items = snapshot.data?.docs
                    .map(
                      (e) => CategoryItemModel.fromFirestoreDoc(
                        e,
                      ),
                    )
                    .toList() ??
                [];

            return BlocProvider(
              create: (context) => EditCategoryCubit(getIt<CategoriesRepo>()),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) => AdminCategoryItem(
                  item: items[index],
                ),
              ),
            );
          }
        });
  }
}
