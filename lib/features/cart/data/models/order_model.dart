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
}
