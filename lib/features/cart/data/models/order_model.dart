// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';

class OrderModel {
  final CartModel cartModel;
  DateTime? orderedAt = DateTime.now();
  String? feedback;
  int? rating;
  double totalPrice = 0;
  OrderModel({
    required this.cartModel,
    this.orderedAt,
    this.feedback,
    this.rating,
  }) {
    for (var product in cartModel.products) {
      totalPrice +=
          (product.quantity * double.parse(product.productModel.price));
    }
  }
  Map<String, dynamic> toMap() {
    return {
      'cartModel': cartModel.toMap(),
      'orderedAt': orderedAt?.toIso8601String(),
      'feedback': feedback,
      'rating': rating,
      'totalPrice': totalPrice,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      cartModel: CartModel.fromMap2(map['cartModel'] as Map<String, dynamic>),
      feedback: map['feedback'] != null ? map['feedback'] as String : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
      orderedAt: DateTime.parse(map['orderedAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
