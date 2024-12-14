// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommerce_app/features/cart/data/models/product_cart_model.dart';

class CartModel {
  final String userID;
  List<ProductCartModel> products = [];

  CartModel({
    required this.userID,
    required this.products,
  });

  CartModel copyWith({
    String? userID,
    List<ProductCartModel>? products,
  }) {
    return CartModel(
      userID: userID ?? this.userID,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      userID: map['userID'] as String,
      products: List<ProductCartModel>.from(
        (map['products'] as List).map<ProductCartModel>(
          (x) => ProductCartModel.fromJson(x as String),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(userID: $userID, products: $products)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.userID == userID && listEquals(other.products, products);
  }

  @override
  int get hashCode => userID.hashCode ^ products.hashCode;
}
