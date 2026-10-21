import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final double height;
  final bool showText;

  const BrandLogo({
    super.key,
    this.height = 36,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    if (showText) {
      return Image.asset(
        'assets/brand/barber_space_logo_pristine.png',
        height: height,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/brand/barber_space_symbol_pristine.png',
            height: height,
            fit: BoxFit.contain,
          );
        },
      );
    }

    return Image.asset(
      'assets/brand/barber_space_symbol_pristine.png',
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );
  }
}
