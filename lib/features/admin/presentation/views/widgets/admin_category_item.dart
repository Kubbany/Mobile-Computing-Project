import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/admin_products_view.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/delete_category_alert.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/edit_category_buttom_sheet.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryItem extends StatelessWidget {
  const AdminCategoryItem({
    super.key,
    required this.item,
  });
  final CategoryItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AdminProductsView(
                categoryID: item.id,
                categoryName: item.categoryName,
              );
            },
          ),
        );
      },
      onDoubleTap: () {
        // Edit Logic
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<EditCategoryCubit>(),
            child: EditCategoryButtomSheet(
              categoryItem: item,
            ),
          ),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<EditCategoryCubit>(),
              child: DeleteCategoryAlert(id: item.id),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 25,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff242328),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  item.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Text(
              item.categoryName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DummyAdminCategoryItem extends StatelessWidget {
  const DummyAdminCategoryItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff242328),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                "assets/images/fashion.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          const Text(
            "daddadad",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
