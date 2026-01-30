import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/Hotel_details_screen.dart';
import 'package:hotel_app/model/hotels.dart';
import 'package:hotel_app/widgets/Silde_design.dart';
import 'package:hotel_app/widgets/color.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({
    super.key,
    required this.destination,
    required this.dateRange,
    required this.adults,
    required this.rooms,
  });

  final String destination;
  final String dateRange;
  final int adults;
  final int rooms;

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  String get checkInText {
    final parts = widget.dateRange.split('-');
    if (parts.isEmpty) return '';
    return parts.first.trim();
  }

  String get checkOutText {
    final parts = widget.dateRange.split('-');
    if (parts.length < 2) return '';
    return parts.last.trim();
  }

  String get roomsGuests => '${widget.rooms} room, ${widget.adults} adults, 0 children';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // ✅ theme background
      body: SafeArea(
        child: Column(
          children: [
            _buildTopSearch(context),
            _buildActionButton(context),
            _buildCategory(context),
            const SizedBox(height: 8),
            Expanded(child: _buildHotelListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSearch(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // ✅ not white
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.yellow, width: 2),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "${widget.destination} · ${widget.dateRange}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(theme, Icons.sort, "Sort"),
          _actionButton(theme, Icons.tune, "Filter"),
          _actionButton(theme, Icons.map, "Map"),
        ],
      ),
    );
  }

  Widget _actionButton(ThemeData theme, IconData icon, String text) {
    final onSurface = theme.colorScheme.onSurface;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 18, color: onSurface.withOpacity(0.85)),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: onSurface.withOpacity(0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    final theme = Theme.of(context);

    final category = [
      "Spa",
      "Swimming pool",
      "Hotels",
      "Family",
      "Pet friendly",
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (_, index) {
          return Chip(
            label: Text(
              category[index],
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            backgroundColor: theme.colorScheme.surface, // ✅
            shape: StadiumBorder(
              side: BorderSide(color: theme.dividerColor), // ✅
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8),
      ),
    );
  }

  Widget _buildHotelListView() {
    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HotelDetailsScreen(
                    hotel: hotel,
                    checkInText: checkInText,
                    checkOutText: checkOutText,
                    roomsGuests: roomsGuests,
                  ),
                ),
              );
            },
            child: SildeDesign(hotel: hotel), // ✅ your theme-safe card
          ),
        );
      },
    );
  }
}
