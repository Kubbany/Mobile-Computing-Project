import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductButtomSheet extends StatelessWidget {
  const EditProductButtomSheet({super.key, required this.productItem});
  final ProductModel productItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocConsumer<EditProductCubit, EditProductState>(
        buildWhen: (previous, current) {
          return current is EditProductFailure ||
              current is EditProductLoading ||
              current is EditProductSuccess;
        },
        listenWhen: (previous, current) {
          return current is EditProductFailure ||
              current is EditProductLoading ||
              current is EditProductSuccess;
        },
        listener: (context, state) {
          if (state is EditProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Product Was Edited"),
              ),
            );
            Navigator.pop(context);
          } else if (state is EditProductFailure) {
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
              isLoading: state is EditProductLoading,
              child: Form(
                key: context.read<EditProductCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Edit Product",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      controller: context.read<EditProductCubit>().imageURL,
                      hintText: "Image URL",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      controller: context.read<EditProductCubit>().title,
                      hintText: "Product Name",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      controller: context.read<EditProductCubit>().subtitle,
                      hintText: "Product Subtitle",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: context.read<EditProductCubit>().price,
                      hintText: "Product Price",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller:
                          context.read<EditProductCubit>().stockQuantity,
                      hintText: "Product Stock Quantity",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      onPressed: () {
                        context
                            .read<EditProductCubit>()
                            .editProduct(productItem);
                      },
                      title: "Edit Product",
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
