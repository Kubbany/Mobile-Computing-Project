import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("carts")
            .doc(
              FirebaseAuth.instance.currentUser!.uid,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
          }
          var items = [];
          if (snapshot.data != null && snapshot.data!.data() != null) {
            var cartModel = CartModel.fromMap(
                snapshot.data!.data() as Map<String, dynamic>);
            items = cartModel.products;
          }

          return SliverList.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => CartItem(
              productCartModel: items[index],
            ),
          );
        });
  }
}
