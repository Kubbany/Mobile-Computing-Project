import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.item});
  final ProductCartModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            item.productModel.title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Text(
          "\$${item.productModel.price}",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: Text(
          "Quantity: ${item.quantity}",
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
