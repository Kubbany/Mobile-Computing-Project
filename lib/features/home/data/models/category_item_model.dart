// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryItemModel {
  final String image;
  final String categoryName;
  final String id;

  const CategoryItemModel(
      {required this.image, required this.categoryName, required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'categoryName': categoryName,
    };
  }

  factory CategoryItemModel.fromFirestoreDoc(QueryDocumentSnapshot snapshot) {
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return CategoryItemModel(
      image: data['image'],
      categoryName: data['categoryName'],
      id: snapshot.id,
    );
  }

  CategoryItemModel copyWith({
    String? image,
    String? categoryName,
  }) {
    return CategoryItemModel(
      image: image ?? this.image,
      categoryName: categoryName ?? this.categoryName,
      id: id,
    );
  }

  @override
  bool operator ==(covariant CategoryItemModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.categoryName == categoryName &&
        other.id == id;
  }

  @override
  int get hashCode => image.hashCode ^ categoryName.hashCode ^ id.hashCode;
}
