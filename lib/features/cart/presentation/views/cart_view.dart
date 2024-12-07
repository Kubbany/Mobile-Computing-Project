import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String id = kCartView;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartViewBody(),
    );
  }
}
