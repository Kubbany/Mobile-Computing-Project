import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditCategoryCubit, EditCategoryState>(
      listenWhen: (previous, current) {
        return current is DeleteCategoryFailure ||
            current is DeleteCategoryLoading ||
            current is DeleteCategorySuccess;
      },
      listener: (context, state) {
        if (state is DeleteCategorySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Category Was Deleted Successfuly",
              ),
            ),
          );
          Navigator.pop(context);
        } else if (state is DeleteCategoryFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
            ),
          );
        }
      },
      child: AlertDialog(
        title: const Text(
          "Confirm Deletion",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: const Text(
          "Are you sure you want to delete this item?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Closes the dialog
            },
          ),
          TextButton(
            child: const Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              context.read<EditCategoryCubit>().deleteCategory(id);
            },
          ),
        ],
      ),
    );
  }
}
