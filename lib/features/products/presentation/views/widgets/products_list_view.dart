import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const CustomProductItem(),
    );
  }
}
