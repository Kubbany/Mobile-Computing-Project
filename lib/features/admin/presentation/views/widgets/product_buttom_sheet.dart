import 'package:ecommerce_app/features/admin/data/repos/products_repo.dart';
import 'package:ecommerce_app/features/admin/presentation/manager/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductButtomSheet extends StatelessWidget {
  const ProductButtomSheet({super.key, required this.catID});
  final String catID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(getIt<ProductsRepo>()),
      child: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocConsumer<AddProductCubit, AddProductState>(
            listener: (context, state) {
              if (state is AddProductSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Product Was Added"),
                  ),
                );
                Navigator.pop(context);
              } else if (state is AddProductFailure) {
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
                  isLoading: state is AddProductLoading,
                  child: Form(
                    key: context.read<AddProductCubit>().formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add New Product",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          controller: context.read<AddProductCubit>().imageURL,
                          hintText: "Image URL",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          controller:
                              context.read<AddProductCubit>().productName,
                          hintText: "Product Name",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          controller: context.read<AddProductCubit>().subtitle,
                          hintText: "Product Subtitle",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          controller: context.read<AddProductCubit>().barcode,
                          hintText: "Barcode",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.number,
                          controller: context.read<AddProductCubit>().price,
                          hintText: "Product Price",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.number,
                          controller:
                              context.read<AddProductCubit>().stockQuantity,
                          hintText: "Product Stock Quantity",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onPressed: () {
                            context.read<AddProductCubit>().addProduct(catID);
                          },
                          title: "Add Product",
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
