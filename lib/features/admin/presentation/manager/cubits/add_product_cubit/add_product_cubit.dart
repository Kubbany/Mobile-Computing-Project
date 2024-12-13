import 'package:ecommerce_app/features/admin/data/repos/products_repo.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.productsRepo) : super(AddProductInitial());
  final ProductsRepo productsRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController imageURL = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final TextEditingController subtitle = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stockQuantity = TextEditingController();

  Future<void> addProduct(String catID) async {
    if (formKey.currentState!.validate()) {
      emit(AddProductLoading());
      final result = await productsRepo.addProduct(
        ProductModel(
          id: "",
          image: imageURL.text,
          title: productName.text,
          subtitle: subtitle.text,
          price: price.text,
          stockQuantity: int.parse(stockQuantity.text),
          catID: catID,
        ),
      );
      result.fold(
        (failure) {
          emit(
            AddProductFailure(errorMessage: failure.message),
          );
        },
        (success) {
          emit(AddProductSuccess());
        },
      );
    }
  }

  @override
  Future<void> close() async {
    imageURL.dispose();
    productName.dispose();
    subtitle.dispose();
    price.dispose();
    stockQuantity.dispose();
    await super.close();
  }
}
