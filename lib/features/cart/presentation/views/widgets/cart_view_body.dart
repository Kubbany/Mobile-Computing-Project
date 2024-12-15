import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cartValue});
  final ValueNotifier<CartModel?> cartValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Cart",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            CartListView(cartValue: cartValue),
          ],
        ),
      ),
    );
  }
}
