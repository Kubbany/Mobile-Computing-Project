import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:ecommerce_app/features/login&register/presentation/views/widgets/custom_button.dart';
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

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 600,
      child: AlertDialog(
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
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Order1",
              ),
              const Text(
                "Order1",
              ),
              const Text(
                "Order1",
              ),
              const Text(
                "Order1",
              ),
              CustomButton(
                onPressed: () {},
                title: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
