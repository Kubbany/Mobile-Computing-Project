import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
            CartListView(),
          ],
        ),
      ),
    );
  }
}
