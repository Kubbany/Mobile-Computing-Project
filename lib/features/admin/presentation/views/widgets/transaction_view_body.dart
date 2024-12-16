import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/models/order_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/order_item.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:ecommerce_app/utils/services/database_service.dart';
import 'package:flutter/material.dart';

class TransactionViewBody extends StatelessWidget {
  const TransactionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt<DatabaseService>().getData("orders"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        List<OrderModel> items = [];
        if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
          items = snapshot.data!.docs
              .map(
                (e) => OrderModel.fromMap(e.data()),
              )
              .toList();
        }
        return SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                    children: items
                        .map((e) => OrderTransactionItem(
                              orderModel: e,
                            ))
                        .toList()),
              )),
        );
      },
    );
  }
}

class OrderTransactionItem extends StatelessWidget {
  const OrderTransactionItem({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${orderModel.orderedAt!.day}-${orderModel.orderedAt!.month}-${orderModel.orderedAt!.year}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrdersView(cartModel: orderModel.cartModel),
                  ),
                );
              },
              leading: const Text(
                "kubbany",
                style: TextStyle(fontSize: 18),
              ),
              title: Text("Feedback: ${orderModel.feedback ?? ""} "),
              subtitle: Text(
                "Rating: ${orderModel.rating ?? ""} ",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrdersView extends StatelessWidget {
  const OrdersView({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children:
                cartModel.products.map((e) => OrderItem(item: e)).toList(),
          ),
        ),
      ),
    );
  }
}
