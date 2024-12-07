import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryColor,
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 15,
            ),
            child: CustomItemImage(image: "assets/images/laptops.jpg"),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Just Laptop",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Just Title For Laptop Details",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$40,000",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            size: 25,
                          ),
                        ),
                        const Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
