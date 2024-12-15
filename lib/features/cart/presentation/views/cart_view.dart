import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/confirm_order.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static const String id = kCartView;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final ValueNotifier<CartModel?> cartValue = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
          onPressed: () {
            if (cartValue.value != null &&
                cartValue.value!.products.isNotEmpty) {
              showDialog(
                context: context,
                builder: (context) => ConfirmOrder(cartValue: cartValue),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Empty Cart"),
                ),
              );
            }
          },
          title: "Submit Order",
        ),
      ),
      body: CartViewBody(cartValue: cartValue),
    );
  }
}
