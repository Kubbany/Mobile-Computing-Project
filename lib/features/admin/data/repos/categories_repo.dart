import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/utils/errors/failure.dart';
import 'package:ecommerce_app/utils/services/database_service.dart';

class CategoriesRepo {
  final DatabaseService databaseService;

  CategoriesRepo({required this.databaseService});

  Future<Either<Failure, List<CategoryItemModel>>> getAllCategories() async {
    try {
      final data = await databaseService.getData("categories");
      return right(
          data?.map((e) => CategoryItemModel.fromMap(e)).toList() ?? []);
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
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
