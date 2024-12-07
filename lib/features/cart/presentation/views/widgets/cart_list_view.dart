import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 15,
      itemBuilder: (context, index) => const CartItem(),
    );
  }
}
