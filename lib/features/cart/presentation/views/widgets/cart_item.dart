import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_quantity.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.productCartModel,
      required this.index,
      required this.cartValue});
  final ProductCartModel productCartModel;
  final int index;
  final ValueNotifier<CartModel?> cartValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: CustomItemImage(image: productCartModel.productModel.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  productCartModel.productModel.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productCartModel.productModel.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${productCartModel.productModel.price}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CartQuantity(
                      productCartModel: productCartModel,
                      index: index,
                      cartValue: cartValue,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
