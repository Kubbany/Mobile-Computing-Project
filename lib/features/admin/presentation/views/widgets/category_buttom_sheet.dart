import 'package:ecommerce_app/features/admin/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/admin/presentation/manager/cubits/add_category_cubit/add_category_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryButtomSheet extends StatelessWidget {
  const CategoryButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(getIt<CategoriesRepo>()),
      child: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocConsumer<AddCategoryCubit, AddCategoryState>(
            listener: (context, state) {
              if (state is AddCategorySuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Category Was Added"),
                  ),
                );
                Navigator.pop(context);
              } else if (state is AddCategoryFailure) {
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
                  isLoading: state is AddCategoryLoading,
                  child: Form(
                    key: context.read<AddCategoryCubit>().formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add New Category",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          controller: context.read<AddCategoryCubit>().imageURL,
                          hintText: "Image URL",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          controller:
                              context.read<AddCategoryCubit>().categoryName,
                          hintText: "Category Name",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onPressed: () {
                            context.read<AddCategoryCubit>().addCategory();
                          },
                          title: "Add Category",
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
      }),
    );
  }
}
