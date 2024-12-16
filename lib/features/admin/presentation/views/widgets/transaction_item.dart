import 'package:ecommerce_app/features/cart/data/models/order_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.items,
  });

  final List<OrderModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: items
              .map(
                (e) => Column(
                  children: e.cartModel.products
                      .map((e) => OrderItem(item: e))
                      .toList(),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
