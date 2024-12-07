import 'package:ecommerce_app/utils/cart_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Abdulrahman",
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        CartIcon(),
      ],
    );
  }
}
