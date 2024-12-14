import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:flutter/material.dart';

class CartQuantity extends StatefulWidget {
  const CartQuantity({
    super.key,
    required this.productCartModel,
  });

  final ProductCartModel productCartModel;

  @override
  State<CartQuantity> createState() => _CartQuantityState();
}

class _CartQuantityState extends State<CartQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (widget.productCartModel.quantity > 0) {
              widget.productCartModel.quantity--;
              setState(() {});
            }
          },
          icon: const Icon(
            Icons.remove,
            size: 25,
          ),
        ),
        Text(
          widget.productCartModel.productModel.stockQuantity == 0
              ? "0"
              : widget.productCartModel.quantity.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            if (widget.productCartModel.quantity <
                widget.productCartModel.productModel.stockQuantity) {
              widget.productCartModel.quantity++;
              setState(() {});
            }
          },
          icon: const Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ],
    );
  }
}
