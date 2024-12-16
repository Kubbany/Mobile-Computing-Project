import 'package:ecommerce_app/utils/scanner_box.dart';
import 'package:flutter/material.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: ScannerBox(),
        ),
      ),
    );
  }
}
