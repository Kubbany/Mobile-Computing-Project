import 'package:ecommerce_app/features/admin/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit(this.categoriesRepo) : super(EditCategoryInitial());
  final CategoriesRepo categoriesRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController imageURL = TextEditingController();
  final TextEditingController categoryName = TextEditingController();

  Future<void> editCategory(CategoryItemModel categoryItem) async {
    if (formKey.currentState!.validate()) {
      emit(EditCategoryLoading());
      final newCategoryItem = categoryItem.copyWith(
        image: imageURL.text,
        categoryName: categoryName.text,
      );
      if (newCategoryItem == categoryItem) {
        emit(EditCategoryFailure(errorMessage: "Same Data, No Changes!"));
        return;
      }
      final result = await categoriesRepo.editCategory(
        newCategoryItem,
      );
      result.fold(
        (failure) {
          emit(
            EditCategoryFailure(errorMessage: failure.message),
          );
        },
        (success) {
          emit(EditCategorySuccess());
        },
      );
    }
  }

  void init(CategoryItemModel categoryItem) {
    imageURL.text = categoryItem.image;
    categoryName.text = categoryItem.categoryName;
  }

  Future<void> deleteCategory(String id) async {
    emit(DeleteCategoryLoading());
    final result = await categoriesRepo.deleteCategory(id);
    result.fold(
      (failure) {
        emit(
          DeleteCategoryFailure(errorMessage: failure.message),
        );
      },
      (success) {
        emit(DeleteCategorySuccess());
      },
    );
  }

  @override
  Future<void> close() async {
    imageURL.dispose();
    categoryName.dispose();
    await super.close();
  }
}
