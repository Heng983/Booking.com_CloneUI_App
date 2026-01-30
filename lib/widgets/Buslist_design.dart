import 'package:flutter/material.dart';
import 'package:hotel_app/model/Bus_model.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:intl/intl.dart';

class BuslistDesign extends StatelessWidget {
  const BuslistDesign({
    super.key,
    required this.blist,
  });

  final BusList blist;

  static final usdFormatter = NumberFormat.currency(
    locale: 'en_US',
    name: 'US\$',
    symbol: 'US\$',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
        border: isDark ? Border.all(color: Colors.white.withOpacity(0.08)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(9)),
            child: Image.asset(
              blist.img,
              height: 370,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            blist.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: onSurface,
            ),
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.tabSelectedBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  blist.rating.toStringAsFixed(1),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Very Good. ${blist.review}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: onSurface.withOpacity(0.75),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 18, color: onSurface.withOpacity(0.75)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  blist.location,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: onSurface),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            "${usdFormatter.format(blist.price)} / per person",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: onSurface,
            ),
          ),

          Text(
            "Includes taxes and fees (Round Trip)",
            style: TextStyle(
              fontSize: 11,
              color: onSurface.withOpacity(0.6),
            ),
          ),

          const SizedBox(height: 10),

          ...blist.benefits.map(
                (b) => Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.green, size: 14),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      b,
                      style: TextStyle(
                        fontSize: 12,
                        color: onSurface.withOpacity(0.85),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
