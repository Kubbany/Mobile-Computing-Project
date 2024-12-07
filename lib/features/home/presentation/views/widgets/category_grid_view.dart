import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/features/products/presentation/views/products_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});
  static const List<CategoryItemModel> items = [
    CategoryItemModel(
        image: "assets/images/fashion.jpg", categoryName: "Fashion"),
    CategoryItemModel(
        image: "assets/images/laptops.jpg", categoryName: "Laptops"),
    CategoryItemModel(
        image: "assets/images/phones.jpg", categoryName: "Phones"),
    CategoryItemModel(
        image: "assets/images/watches.jpg", categoryName: "Watches"),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 20,
        mainAxisSpacing: 50,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsView(
                categoryName: items[index].categoryName,
              ),
            ),
          );
        },
        child: CategoryItem(
          item: items[index],
        ),
      ),
    );
  }
}
