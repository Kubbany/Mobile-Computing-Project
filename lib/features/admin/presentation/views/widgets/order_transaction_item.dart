import 'package:ecommerce_app/features/admin/presentation/views/orders_view.dart';
import 'package:ecommerce_app/features/cart/data/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderTransactionItem extends StatelessWidget {
  const OrderTransactionItem({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrdersView(cartModel: orderModel.cartModel),
            ),
          );
        },
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text("Feedback: ${orderModel.feedback ?? ""} "),
        ),
        subtitle: Text(
          "Rating: ${orderModel.rating ?? ""} ",
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Text(
          orderModel.totalPrice.toString(),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
