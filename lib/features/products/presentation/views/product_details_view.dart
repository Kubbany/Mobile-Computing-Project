import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.item});
  static const String id = kProductDetailsView;
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsViewBody(item: item),
    );
  }
}
