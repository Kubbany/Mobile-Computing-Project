import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_product_item.dart';
import 'package:ecommerce_app/utils/custom_app_bar.dart';
import 'package:ecommerce_app/utils/custom_search_field.dart';
import 'package:flutter/material.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key, required this.categoryName});
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
                  const CustomAppBar(),
                  const SizedBox(
                    height: 25,
                  ),
                  const CustomSearchField(),
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
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const CustomProductItem(),
            ),
          ],
        ),
      ),
    );
  }
}
