// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final String price;
  int stockQuantity;
  final String catID;
  int numOfSellings;
  final String? barcode;

  ProductModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.stockQuantity,
      required this.catID,
      this.numOfSellings = 0,
      this.barcode});

  ProductModel copyWith({
    String? id,
    String? image,
    String? title,
    String? subtitle,
    String? price,
    int? stockQuantity,
    String? catID,
    int? numOfSellings,
    String? barcode,
  }) {
    return ProductModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      catID: catID ?? this.catID,
      numOfSellings: numOfSellings ?? this.numOfSellings,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'stockQuantity': stockQuantity,
      'catID': catID,
      'numOfSellings': numOfSellings,
      'barcode': barcode,
    };
  }

  factory ProductModel.fromFirestoreDoc(QueryDocumentSnapshot snapshot) {
    final Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
      id: snapshot.id,
      image: map['image'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      price: map['price'] as String,
      stockQuantity: map['stockQuantity'] as int,
      catID: map['catID'] as String,
      numOfSellings: map['numOfSellings'] as int,
      barcode: map['barcode'] as String?,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      price: map['price'] as String,
      stockQuantity: map['stockQuantity'] as int,
      catID: map['catID'] as String,
      numOfSellings: map['numOfSellings'] as int,
      barcode: map['barcode'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, image: $image, title: $title, subtitle: $subtitle, price: $price, stockQuantity: $stockQuantity, catID: $catID, numOfSellings: $numOfSellings)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.price == price &&
        other.stockQuantity == stockQuantity &&
        other.catID == catID &&
        other.numOfSellings == numOfSellings &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        price.hashCode ^
        stockQuantity.hashCode ^
        catID.hashCode ^
        numOfSellings.hashCode ^
        barcode.hashCode;
  }
}
