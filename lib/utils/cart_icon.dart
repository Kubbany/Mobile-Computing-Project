import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, CartView.id);
      },
      icon: Container(
        width: 65,
        height: 65,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        ),
      ),
    );
  }
}
