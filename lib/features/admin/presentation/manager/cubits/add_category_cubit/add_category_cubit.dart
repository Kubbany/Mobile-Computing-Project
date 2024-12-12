import 'package:ecommerce_app/features/admin/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this.categoriesRepo) : super(AddCategoryInitial());
  final CategoriesRepo categoriesRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController imageURL = TextEditingController();
  final TextEditingController categoryName = TextEditingController();

  Future<void> addCategory() async {
    if (formKey.currentState!.validate()) {
      emit(AddCategoryLoading());
      final result = await categoriesRepo.addCategory(
        CategoryItemModel(
            image: imageURL.text, categoryName: categoryName.text),
      );
      result.fold(
        (failure) {
          emit(
            AddCategoryFailure(errorMessage: failure.message),
          );
        },
        (success) {
          emit(AddCategorySuccess());
        },
      );
    }
  }

  @override
  Future<void> close() async {
    imageURL.dispose();
    categoryName.dispose();
    await super.close();
  }
}
