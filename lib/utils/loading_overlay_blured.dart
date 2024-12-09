import 'dart:ui';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class LoadingOverlayBlured extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final double blurEffectIntensity;
  final String? text;
  const LoadingOverlayBlured({
    super.key,
    required this.child,
    required this.isLoading,
    this.blurEffectIntensity = 1.3,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ImageFiltered(
          enabled: isLoading,
          imageFilter: ImageFilter.blur(
            sigmaX: blurEffectIntensity,
            sigmaY: blurEffectIntensity,
          ),
          child: child,
        ),
        if (isLoading) ...[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
            ),
          ),
          if (text != null)
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 12),
                    const CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          if (text == null)
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
        ]
      ],
    );
  }
}
