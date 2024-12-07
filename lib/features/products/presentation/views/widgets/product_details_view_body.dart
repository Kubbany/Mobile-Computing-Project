import 'package:ecommerce_app/features/login&register/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.asset(
              "assets/images/watches.jpg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rolex Watch",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Consider This As A Title For Rolex Watch",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "\$40,000",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {},
                  title: "Add To Cart",
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Leave Your Feedback",
                    contentPadding: const EdgeInsetsDirectional.symmetric(
                      vertical: 40,
                      horizontal: 15,
                    ),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(
                      color: Colors.blue,
                    ),
                    hintText: "Leave Your Rating",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.grey,
      ),
    );
  }
}
