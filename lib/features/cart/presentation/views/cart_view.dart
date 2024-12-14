import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/confirm_order.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String id = kCartView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const ConfirmOrder(),
            );
          },
          title: "Submit Order",
        ),
      ),
      body: const CartViewBody(),
    );
  }
}
