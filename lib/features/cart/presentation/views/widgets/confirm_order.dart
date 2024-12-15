// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/models/order_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({
    super.key,
    required this.cartValue,
  });
  final ValueNotifier<CartModel?> cartValue;

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController feedback = TextEditingController();
  final TextEditingController rating = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 600,
      child: ValueListenableBuilder(
          valueListenable: widget.cartValue,
          builder: (context, value, child) {
            final OrderModel orderModel = OrderModel(cartModel: value!);
            final cartItems = orderModel.cartModel.products;
            return AlertDialog(
              backgroundColor: kPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              title: const Text(
                "Order Preview",
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: cartItems
                              .map(
                                (e) => OrderItem(
                                  item: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total Price: \$${orderModel.totalPrice}",
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: feedback,
                              decoration: InputDecoration(
                                hintText: "Feedback",
                                enabledBorder: buildBorder(),
                                focusedBorder: buildBorder(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: rating,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: buildBorder(),
                                focusedBorder: buildBorder(
                                  color: Colors.blue,
                                ),
                                hintText: "Rating (1-10)",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        onPressed: () async {
                          orderModel.feedback = feedback.text;
                          final items = orderModel.cartModel.products;
                          for (var item in items) {
                            item.productModel.numOfSellings += item.quantity;
                            item.productModel.stockQuantity -= item.quantity;
                          }
                          orderModel.orderedAt = DateTime.now();
                          orderModel.rating = int.tryParse(rating.text);
                          await pushOrder(orderModel, context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          await FirebaseFirestore.instance
                              .collection("carts")
                              .doc(orderModel.cartModel.userID)
                              .delete();
                          widget.cartValue.value = null;
                        },
                        title: "Submit",
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> pushOrder(OrderModel orderModel, BuildContext context) async {
    try {
      final orderCollection = FirebaseFirestore.instance.collection('orders');
      await orderCollection.add(orderModel.toMap());
      for (var item in orderModel.cartModel.products) {
        final productCollection =
            FirebaseFirestore.instance.collection("products");
        await productCollection.doc(item.productModel.id).update(
              item.productModel.toMap(),
            );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order Added Successfuly"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.grey,
      ),
    );
  }
}
