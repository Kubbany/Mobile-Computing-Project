// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.network(
              item.image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    ProductCartModel productCartModel =
                        ProductCartModel(productModel: item);
                    CartModel cartModel = CartModel(
                      userID: FirebaseAuth.instance.currentUser!.uid,
                      products: [productCartModel],
                    );
                    saveCartToFirestore(cartModel, productCartModel, context)
                        .then(
                      (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      },
                      onError: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Something Went Wrong, Try Again Later!"),
                          ),
                        );
                      },
                    );
                  },
                  title: "Add To Cart",
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Leave Your Feedback",
                    contentPadding: const EdgeInsetsDirectional.symmetric(
                      vertical: 40,
                      horizontal: 15,
                    ),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(
                      color: Colors.blue,
                    ),
                    hintText: "Leave Your Rating",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1c4670),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Submit Feedback",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
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

Future<String> saveCartToFirestore(
    CartModel cart, ProductCartModel productCart, BuildContext context) async {
  final cartRef =
      FirebaseFirestore.instance.collection('carts').doc(cart.userID);

  final productData = productCart.toJson();
  final data = await cartRef.get();
  if (data.data() != null) {
    final Map<String, dynamic> map = data.data() as Map<String, dynamic>;
    if ((map['products'] as List<dynamic>).contains(productData)) {
      return "Item Already Exists";
    }
  }

  await cartRef.set({
    'userID': cart.userID,
    'products': FieldValue.arrayUnion([productData]),
  }, SetOptions(merge: true));
  return "Item Was Added Sucessfuly";
}
