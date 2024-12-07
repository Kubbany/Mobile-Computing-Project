import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.asset(
                      "assets/images/laptops.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const Column(
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
