import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/utils/errors/failure.dart';
import 'package:ecommerce_app/utils/services/database_service.dart';

class CategoriesRepo {
  final DatabaseService databaseService;

  CategoriesRepo({required this.databaseService});

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories() {
    return databaseService.getData("categories");
  }

  Future<Either<Failure, bool>> addCategory(
      CategoryItemModel categoryItem) async {
    try {
      await databaseService.addData("categories", categoryItem.toMap());
      return right(true);
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteCategory(
      CategoryItemModel categoryItem) async {
    try {
      await databaseService.deleteData("cateogires", categoryItem.id!);
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
