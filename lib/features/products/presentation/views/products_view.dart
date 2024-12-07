import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.categoryName});
  static const String id = kProductsView;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsViewBody(categoryName: categoryName),
    );
  }
}
