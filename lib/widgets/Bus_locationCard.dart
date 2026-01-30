import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/color.dart';

class BusLocationCard extends StatelessWidget {
  const BusLocationCard({
    super.key,
    required this.title,
    required this.primary,
    required this.onTap,
  });

  final String title;
  final Color primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isPlaceholder = title.startsWith('Choose');

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.yellow,
            width: 2,
          ),
          boxShadow: isDark
              ? []
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: 28,
              color: isPlaceholder
                  ? theme.colorScheme.onSurface.withOpacity(0.4)
                  : primary,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isPlaceholder
                    ? theme.colorScheme.onSurface.withOpacity(0.6)
                    : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
