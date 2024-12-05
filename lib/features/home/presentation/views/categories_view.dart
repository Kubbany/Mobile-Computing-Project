import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/categories_view_body.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  static const String id = kCategoriesView;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesViewBody(),
    );
  }
}
