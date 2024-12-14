import 'package:ecommerce_app/utils/cart_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.username,
  });
  final String username;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          username,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        const CartIcon(),
      ],
    );
  }
}
