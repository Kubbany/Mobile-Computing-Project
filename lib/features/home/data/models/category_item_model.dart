// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryItemModel {
  final String image;
  final String categoryName;
  final String? id;

  const CategoryItemModel(
      {required this.image, required this.categoryName, this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'categoryName': categoryName,
      'id': id,
    };
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      image: map['image'] as String,
      categoryName: map['categoryName'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryItemModel.fromJson(String source) =>
      CategoryItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
