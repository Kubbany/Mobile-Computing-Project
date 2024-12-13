import 'package:ecommerce_app/features/admin/data/repos/products_repo.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit(this.productsRepo) : super(EditProductInitial());
  final ProductsRepo productsRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController imageURL = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController subtitle = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stockQuantity = TextEditingController();

  Future<void> editProduct(ProductModel productItem) async {
    if (formKey.currentState!.validate()) {
      emit(EditProductLoading());
      final newProductItem = productItem.copyWith(
        image: imageURL.text,
        title: title.text,
        subtitle: subtitle.text,
        price: price.text,
        stockQuantity: int.parse(stockQuantity.text),
      );
      if (newProductItem == productItem) {
        emit(EditProductFailure(errorMessage: "Same Data, No Changes!"));
        return;
      }
      final result = await productsRepo.editProduct(
        newProductItem,
      );
      result.fold(
        (failure) {
          emit(
            EditProductFailure(errorMessage: failure.message),
          );
        },
        (success) {
          emit(EditProductSuccess());
        },
      );
    }
  }

  void init(ProductModel productItem) {
    imageURL.text = productItem.image;
    title.text = productItem.title;
  }

  Future<void> deleteProduct(String id) async {
    emit(DeleteProductLoading());
    final result = await productsRepo.deleteProduct(id);
    result.fold(
      (failure) {
        emit(
          DeleteProductFailure(errorMessage: failure.message),
        );
      },
      (success) {
        emit(DeleteProductSuccess());
      },
    );
  }

  @override
  Future<void> close() async {
    imageURL.dispose();
    title.dispose();
    subtitle.dispose();
    price.dispose();
    stockQuantity.dispose();
    await super.close();
  }
}
