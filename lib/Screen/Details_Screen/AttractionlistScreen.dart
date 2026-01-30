import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/AttractionDetailsScreen.dart';
import 'package:hotel_app/widgets/AttractionSlide_design.dart';
import '../../widgets/color.dart';
import '../../model/Attraction_place.dart';

class AttractionListScreen extends StatefulWidget {
  const AttractionListScreen({
    super.key,
    required this.destination,
  });

  final String destination;

  @override
  State<AttractionListScreen> createState() => _AttractionListScreenState();
}

class _AttractionListScreenState extends State<AttractionListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopSearch(context),
            _buildActionButton(context),
            const SizedBox(height: 6),
            Expanded(child: _buildAttractionListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSearch(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.yellow, width: 2),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(999),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(Icons.arrow_back, color: onSurface),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.destination,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(onSurface, Icons.sort, "Sort"),
          _actionButton(onSurface, Icons.tune, "Filter"),
          _actionButton(onSurface, Icons.map, "Map"),
        ],
      ),
    );
  }

  Widget _actionButton(Color onSurface, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: onSurface.withOpacity(0.85)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: onSurface.withOpacity(0.85)),
        ),
      ],
    );
  }

  Widget _buildAttractionListView() {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final plist = places[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AttractionDetailsScreen(plist: plist),
                ),
              );
            },
            child: AttractionslideDesign(p: plist),
          ),
        );
      },
    );
  }
}
