part of 'edit_product_cubit.dart';

@immutable
sealed class EditProductState {}

final class EditProductInitial extends EditProductState {}

final class EditProductLoading extends EditProductState {}

final class EditProductSuccess extends EditProductState {}

final class EditProductFailure extends EditProductState {
  final String errorMessage;

  EditProductFailure({required this.errorMessage});
}

final class DeleteProductLoading extends EditProductState {}

final class DeleteProductSuccess extends EditProductState {}

final class DeleteProductFailure extends EditProductState {
  final String errorMessage;

  DeleteProductFailure({required this.errorMessage});
}
