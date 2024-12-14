import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 600,
      child: AlertDialog(
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        title: const Text(
          "Order Preview",
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Order1",
              ),
              const Text(
                "Order1",
              ),
              const Text(
                "Order1",
              ),
              const Text(
                "Order1",
              ),
              CustomButton(
                onPressed: () {},
                title: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
