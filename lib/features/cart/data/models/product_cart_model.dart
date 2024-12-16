// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_app/features/products/data/models/product_model.dart';

class ProductCartModel {
  final ProductModel productModel;
  int quantity;

  ProductCartModel({
    required this.productModel,
    this.quantity = 1,
  });

  ProductCartModel copyWith({
    ProductModel? productModel,
    int? quantity,
  }) {
    return ProductCartModel(
      productModel: productModel ?? this.productModel,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': productModel.id,
      'image': productModel.image,
      'title': productModel.title,
      'subtitle': productModel.subtitle,
      'price': productModel.price,
      'stockQuantity': productModel.stockQuantity,
      'catID': productModel.catID,
      'numOfSellings': productModel.numOfSellings,
      'barcode': productModel.barcode,
      'quantity': quantity,
    };
  }

  factory ProductCartModel.fromMap(Map<String, dynamic> map) {
    return ProductCartModel(
      productModel: ProductModel.fromMap(map),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCartModel.fromJson(String source) =>
      ProductCartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductCartModel(productModel: $productModel, quantity: $quantity)';

  @override
  bool operator ==(covariant ProductCartModel other) {
    if (identical(this, other)) return true;

    return other.productModel == productModel && other.quantity == quantity;
  }

  @override
  int get hashCode => productModel.hashCode ^ quantity.hashCode;
}
