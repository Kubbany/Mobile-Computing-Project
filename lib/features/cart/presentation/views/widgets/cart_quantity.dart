import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:flutter/material.dart';

class CartQuantity extends StatefulWidget {
  const CartQuantity({
    super.key,
    required this.productCartModel,
    required this.cartValue,
    required this.index,
  });

  final ProductCartModel productCartModel;
  final ValueNotifier<CartModel?> cartValue;
  final int index;
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
              List<ProductCartModel> products =
                  widget.cartValue.value!.products;
              widget.productCartModel.quantity--;
              products[widget.index].quantity--;
              widget.cartValue.value =
                  widget.cartValue.value!.copyWith(products: products);
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
              List<ProductCartModel> products =
                  widget.cartValue.value!.products;
              widget.productCartModel.quantity++;
              products[widget.index].quantity++;
              widget.cartValue.value =
                  widget.cartValue.value!.copyWith(products: products);
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
