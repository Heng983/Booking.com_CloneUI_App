import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/color.dart';

class BusDatecard extends StatelessWidget {
  const BusDatecard({
    super.key,
    required this.label,
    required this.value,
    required this.primary,
    required this.onTap,
  });

  final String label;
  final String value;
  final Color primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isPlaceholder = value == 'Add Date';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: isDark
              ? Border.all(color: Colors.white.withOpacity(0.08))
              : null,
          boxShadow: isDark
              ? []
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 20,
                  color: AppColors.blueColor,
                ),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isPlaceholder
                        ? theme.colorScheme.onSurface.withOpacity(0.4)
                        : theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
