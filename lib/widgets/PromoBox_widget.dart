import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/color.dart';
import '../model/PromoBox.dart';

class PromoBoxWidget extends StatelessWidget {
  const PromoBoxWidget({
    super.key,
    required this.data,
  });

  final Promobox data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.yellow,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  data.subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: cs.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.tabSelectedBlue,
                width: 2,
              ),
            ),
            child: Icon(
              data.icon,
              color: AppColors.tabSelectedBlue,
            ),
          ),
        ],
      ),
    );
  }
}
