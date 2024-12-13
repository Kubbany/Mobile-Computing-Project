part of 'edit_category_cubit.dart';

@immutable
sealed class EditCategoryState {}

final class EditCategoryInitial extends EditCategoryState {}

final class EditCategoryLoading extends EditCategoryState {}

final class EditCategorySuccess extends EditCategoryState {}

final class EditCategoryFailure extends EditCategoryState {
  final String errorMessage;

  EditCategoryFailure({required this.errorMessage});
}

final class DeleteCategoryLoading extends EditCategoryState {}

final class DeleteCategorySuccess extends EditCategoryState {}

final class DeleteCategoryFailure extends EditCategoryState {
  final String errorMessage;

  DeleteCategoryFailure({required this.errorMessage});
}
