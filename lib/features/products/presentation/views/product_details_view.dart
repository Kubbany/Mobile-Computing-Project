import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const String id = kProductDetailsView;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductDetailsViewBody(),
    );
  }
}
