import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/products/presentation/views/product_details_view.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailsView(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 15,
              ),
              child: CustomItemImage(image: "assets/images/laptops.jpg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Just Laptop",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Just Title For Laptop Details",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$40,000",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
