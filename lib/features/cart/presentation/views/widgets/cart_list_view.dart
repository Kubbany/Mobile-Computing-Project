// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  Future<void> _deleteItemFromFirebase(BuildContext context,
      ProductCartModel productCartModel, int index) async {
    final currentContext = context;
    try {
      // Reference to the user's cart document
      final cartDoc = FirebaseFirestore.instance
          .collection("carts")
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // Fetch the cart document
      final cartSnapshot = await cartDoc.get();
      if (cartSnapshot.exists) {
        // Extract the current list of products
        final cartData = cartSnapshot.data() as Map<String, dynamic>;
        final List<dynamic> products = cartData['products'] ?? [];

        // Remove the specific product by matching its ID
        products.removeAt(index);

        // Update the Firestore document with the modified list
        await cartDoc.update({'products': products});
        if (ModalRoute.of(currentContext)?.isActive == true) {
          ScaffoldMessenger.of(currentContext).showSnackBar(
            SnackBar(
              content: Text(
                  '${productCartModel.productModel.title} Removed From Cart'),
            ),
          );
        }
      }
    } catch (e) {
      if (ModalRoute.of(currentContext)?.isActive == true) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Failed to remove item. Please try again.'),
          ),
        );
      }
    }
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, ProductCartModel productCartModel, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove'),
        content: Text(
            'Are you sure you want to remove "${productCartModel.productModel.title}" from the cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Cancel
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _deleteItemFromFirebase(context, productCartModel, index);
              // Future.delayed(
              //   const Duration(milliseconds: 700),
              // );
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  const CartListView({super.key, required this.cartValue});
  final ValueNotifier<CartModel?> cartValue;
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
          var cartModel =
              CartModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
          items = cartModel.products;
          cartValue.value = cartModel;
        }

        return SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => GestureDetector(
            onLongPress: () {
              _showDeleteConfirmationDialog(context, items[index], index);
            },
            child: CartItem(
              productCartModel: items[index],
              index: index,
              cartValue: cartValue,
            ),
          ),
        );
      },
    );
  }
}
