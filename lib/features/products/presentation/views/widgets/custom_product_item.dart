import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/presentation/views/product_details_view.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.item,
  });
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(
              item: item,
            ),
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: CustomItemImage(image: item.image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
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
