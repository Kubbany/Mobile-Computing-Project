import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
            Text(
              "Abdulrahman",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
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
        ),
      ],
    );
  }
}
