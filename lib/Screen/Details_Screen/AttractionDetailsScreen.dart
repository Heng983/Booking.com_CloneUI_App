import 'package:flutter/material.dart';
import 'package:hotel_app/model/Attraction_place.dart';
import 'package:hotel_app/widgets/color.dart';
import '../../widgets/ExpandableText.dart';

class AttractionDetailsScreen extends StatelessWidget {
  const AttractionDetailsScreen({super.key, required this.plist});

  final Place plist;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        title: Text(
          plist.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Icon(Icons.ios_share_outlined),
          SizedBox(width: 12),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "See availability",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildPhoto(),
          const SizedBox(height: 16),
          _buildInfo(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final onBg = theme.colorScheme.onBackground;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          plist.name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: onBg,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star_border, color: Colors.amber, size: 18),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "Genius",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                plist.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.location_on_outlined,
                size: 18, color: onBg.withOpacity(0.75)),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                plist.location,
                style: TextStyle(
                  fontSize: 13,
                  color: onBg.withOpacity(0.85),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          "Excellent location!",
          style: TextStyle(
            fontSize: 13,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  Widget _buildPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        plist.image,
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final theme = Theme.of(context);
    final onBg = theme.colorScheme.onBackground;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (plist.benefits.contains("Free cancellation")) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Free cancellation available",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Up to 24 hours before the start time",
                      style: TextStyle(
                        fontSize: 15,
                        color: onBg.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
        Row(
          children: [
            Icon(Icons.access_time, size: 22, color: onBg.withOpacity(0.8)),
            const SizedBox(width: 10),
            Text(
              "Duration: ${plist.duration} hours",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: onBg,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Description",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: onBg,
          ),
        ),
        const SizedBox(height: 10),
        ExpanDableText(
          text: plist.description,
          trimLines: 6,
        ),
      ],
    );
  }
}
