import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/delete_product_alert.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/edit_product_bottom_sheet.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/presentation/views/widgets/custom_item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAdminProductItem extends StatelessWidget {
  const CustomAdminProductItem({
    super.key,
    required this.item,
  });
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        // Edit Logic
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<EditProductCubit>(),
            child: EditProductButtomSheet(
              productItem: item,
            ),
          ),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<EditProductCubit>(),
              child: DeleteProductAlert(id: item.id),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: CustomItemImage(image: item.image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DummyAdminProductItem extends StatelessWidget {
  const DummyAdminProductItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 15,
              ),
              child: CustomItemImage(
                image: "https://i.ibb.co/yVcPkLG/fashion.jpg",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Just Laptop",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Just Title For Laptop Details",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$40,000",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
