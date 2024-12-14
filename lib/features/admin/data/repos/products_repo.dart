import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/utils/errors/failure.dart';
import 'package:ecommerce_app/utils/services/database_service.dart';

class ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepo({required this.databaseService});

  Stream<QuerySnapshot<Map<String, dynamic>>> getCategoryProducts() {
    return databaseService.getData("products");
  }

  Future<Either<Failure, bool>> addProduct(ProductModel productItem) async {
    try {
      await databaseService.addData("products", productItem.toMap());
      return right(true);
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteProduct(String id) async {
    try {
      await databaseService.deleteData("products", id);
      return right(true);
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> editProduct(ProductModel productItem) async {
    try {
      await databaseService.editData(
          "products", productItem.id, productItem.toMap());
      log("From Repo: ${productItem.id} \n ${productItem.toMap().toString()}");
      return right(true);
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
