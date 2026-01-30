import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_highlight.dart';
import '../../model/hotels.dart';
import '../../widgets/color.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({
    super.key,
    required this.hotel,
    required this.checkInText,
    required this.checkOutText,
    required this.roomsGuests,
  });

  final Hotel hotel;
  final String checkInText;
  final String checkOutText;
  final String roomsGuests;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        title: Text(
          hotel.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.ios_share_outlined, color: Colors.white),
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
                "Select room",
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
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildPhoto(),
          const SizedBox(height: 24),
          _buildHotelHighlightsCard(context),
          const SizedBox(height: 24),
          _buildStayInfo(context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: onSurface,
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

            // Genius badge
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

            // Rating badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                hotel.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),

        Text(
          hotel.location,
          style: TextStyle(
            fontSize: 13,
            color: onSurface.withOpacity(0.85),
          ),
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
    final images = List<String>.filled(5, hotel.image);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 220,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final img = images[index];
            final isLast = index == images.length - 1;

            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(img, fit: BoxFit.cover),
                if (isLast)
                  Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: const Text(
                      '+5',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            );
          },
          shrinkWrap: true,
        ),
      ),
    );
  }

  Widget _buildHotelHighlightsCard(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hotel Highlight",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: onBg,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: highLights.length,
            itemBuilder: (context, index) {
              final h = highLights[index];
              return _buildHotelHighlightsDesign(
                context: context,
                highlight: h,
                showArrow: index == 1,
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildHotelHighlightsDesign({
    required BuildContext context,
    required HotelHighlight highlight,
    bool showArrow = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.10)
              : Colors.black.withOpacity(0.10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: onSurface.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Icon(
              highlight.icon,
              size: 22,
              color: onSurface.withOpacity(0.85),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  highlight.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  highlight.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: onSurface.withOpacity(0.65),
                  ),
                ),
              ],
            ),
          ),
          if (showArrow)
            Icon(Icons.chevron_right, color: onSurface.withOpacity(0.7)),
        ],
      ),
    );
  }

  Widget _buildStayInfo(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    // use primary (blue) but still theme-safe
    final accent = theme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check-in',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      checkInText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: accent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check-out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      checkOutText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: accent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Rooms and guests',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            roomsGuests,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: accent,
            ),
          ),
        ],
      ),
    );
  }
}
