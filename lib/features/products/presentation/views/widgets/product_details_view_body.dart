import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.network(
              item.image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {},
                  title: "Add To Cart",
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Leave Your Feedback",
                    contentPadding: const EdgeInsetsDirectional.symmetric(
                      vertical: 40,
                      horizontal: 15,
                    ),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(
                      color: Colors.blue,
                    ),
                    hintText: "Leave Your Rating",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.grey,
      ),
    );
  }
}
