import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/categories_view_body.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/user_drawer.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.userModel});
  static const String id = kCategoriesView;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawer(
        email: userModel.email,
        username: userModel.username,
      ),
      body: const CategoriesViewBody(),
    );
  }
}
