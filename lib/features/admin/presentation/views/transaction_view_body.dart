import 'package:ecommerce_app/features/admin/presentation/views/widgets/order_transaction_item.dart';
import 'package:ecommerce_app/features/cart/data/models/order_model.dart';
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
          items = snapshot.data!.docs.reversed
              .map(
                (e) => OrderModel.fromMap(e.data()),
              )
              .toList();
        }
        final Map<String, List<OrderModel>> groupedOrders =
            groupOrdersByDate(items);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: ListView(
              children: groupedOrders.entries.map(
                (entry) {
                  final String date = entry.key;
                  final List<OrderModel> ordersForDate = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        ...ordersForDate.map(
                          (order) {
                            return OrderTransactionItem(orderModel: order);
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}

Map<String, List<OrderModel>> groupOrdersByDate(List<OrderModel> orders) {
  final Map<String, List<OrderModel>> groupedOrders = {};

  for (var order in orders) {
    final String date = "${order.orderedAt?.day.toString().padLeft(2, '0')}-"
        "${order.orderedAt?.month.toString().padLeft(2, '0')}-"
        "${order.orderedAt?.year}";

    if (!groupedOrders.containsKey(date)) {
      groupedOrders[date] = [];
    }
    groupedOrders[date]!.add(order);
  }

  return groupedOrders;
}
