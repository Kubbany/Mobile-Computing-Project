import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCategoryButtomSheet extends StatelessWidget {
  const EditCategoryButtomSheet({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocConsumer<EditCategoryCubit, EditCategoryState>(
        buildWhen: (previous, current) {
          return current is EditCategoryFailure ||
              current is EditCategoryLoading ||
              current is EditCategorySuccess;
        },
        listenWhen: (previous, current) {
          return current is EditCategoryFailure ||
              current is EditCategoryLoading ||
              current is EditCategorySuccess;
        },
        listener: (context, state) {
          if (state is EditCategorySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Category Was Edited"),
              ),
            );
            Navigator.pop(context);
          } else if (state is EditCategoryFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: LoadingOverlayBlured(
              isLoading: state is EditCategoryLoading,
              child: Form(
                key: context.read<EditCategoryCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Edit Category",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      controller: context.read<EditCategoryCubit>().imageURL,
                      hintText: "Image URL",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      controller:
                          context.read<EditCategoryCubit>().categoryName,
                      hintText: "Category Name",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      onPressed: () {
                        context
                            .read<EditCategoryCubit>()
                            .editCategory(categoryItem);
                      },
                      title: "Edit Category",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
