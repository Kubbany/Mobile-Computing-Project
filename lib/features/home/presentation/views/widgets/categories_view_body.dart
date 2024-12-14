import 'package:ecommerce_app/features/home/presentation/views/widgets/category_grid_view.dart';
import 'package:ecommerce_app/utils/custom_app_bar.dart';
import 'package:ecommerce_app/utils/custom_search_field.dart';
import 'package:flutter/material.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              username: username,
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomSearchField(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: CategoryGridView(
                username: username,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
