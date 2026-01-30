import 'package:flutter/material.dart';
import 'package:hotel_app/model/CarRental_brand.dart';

class CarrentalWidget extends StatelessWidget {
  const CarrentalWidget({super.key, required this.logo});

  final RentalModel logo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;

    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
        ],
        border: isDark
            ? Border.all(color: Colors.white.withOpacity(0.08))
            : null,
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Image.network(
          logo.image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
