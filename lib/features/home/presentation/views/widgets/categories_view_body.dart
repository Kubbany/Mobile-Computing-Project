import 'package:ecommerce_app/features/home/presentation/views/widgets/category_grid_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

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
            CustomAppBar(),
            SizedBox(
              height: 25,
            ),
            CustomSearchField(),
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
              child: CategoryGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
