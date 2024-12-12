import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CategoryButtomSheet extends StatelessWidget {
  const CategoryButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
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
            const CustomTextField(
              hintText: "Image URL",
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomTextField(
              hintText: "Category Name",
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(onPressed: () {}, title: "Add Category"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
