import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.heroTag,
    required this.onPressed,
  });
  final String heroTag;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "Add Category",
      backgroundColor: Colors.blue.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          999,
        ),
      ),
      onPressed: () {},
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
