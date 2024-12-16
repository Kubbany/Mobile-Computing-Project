import 'package:flutter/material.dart';

class FlashIcon extends StatelessWidget {
  const FlashIcon({
    super.key,
    required this.flashOn,
  });

  final bool flashOn;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(
          flashOn ? Icons.flash_on_outlined : Icons.flash_off_outlined,
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
        ),
      ),
    );
  }
}
