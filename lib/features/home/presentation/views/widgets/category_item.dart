import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.item,
  });
  final CategoryItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff242328),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                item.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          Text(
            item.categoryName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
