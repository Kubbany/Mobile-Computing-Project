import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAdminSearchField extends StatelessWidget {
  const CustomAdminSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic_none,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        filled: true,
        fillColor: kPrimaryColor,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        999,
      ),
    );
  }
}
