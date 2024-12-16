// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_app/utils/flash_icon.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerBox extends StatefulWidget {
  const ScannerBox({super.key});
  @override
  State<ScannerBox> createState() => _ScannerBoxState();
}

class _ScannerBoxState extends State<ScannerBox> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final MobileScannerController controller = MobileScannerController();
  bool flashOn = false;
  bool scanComplete = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomStart,
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (result) async {
              final String? codeValue = result.barcodes.first.rawValue;
              if (codeValue != null && codeValue.isNotEmpty && !scanComplete) {
                scanComplete = true;
                Navigator.pop(context, codeValue);
                await Future.delayed(const Duration(seconds: 3))
                    .then((value) => scanComplete = false);
                return;
              }
            },
            errorBuilder: (context, e, child) {
              return Center(
                child: Text(e.errorDetails?.message ?? "Something Went Wrong"),
              );
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4, bottom: 4),
            child: InkWell(
              onTap: () async {
                await controller.toggleTorch();
                setState(() => flashOn = !flashOn);
              },
              child: FlashIcon(flashOn: flashOn),
            ),
          ),
        ],
      ),
    );
  }
}
