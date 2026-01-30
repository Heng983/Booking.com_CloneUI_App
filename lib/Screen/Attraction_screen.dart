import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/AttractionDetailsScreen.dart';
import 'package:hotel_app/Screen/Details_Screen/AttractionlistScreen.dart';
import 'package:hotel_app/model/PromoBox.dart';
import 'package:hotel_app/widgets/AttractionSlide_design.dart';
import 'package:hotel_app/widgets/PromoBox_widget.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:intl/intl.dart';

import '../model/Attraction_place.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({super.key});

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen> {
  final TextEditingController _destinationController = TextEditingController();

  DateTime? _selectBookingDate;
  DateTime get today => DateTime.now();
  DateTime get twoWeeksLater => today.add(const Duration(days: 14));

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildSearch(context),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: _buildAttractionSlideView(context),
        ),
        const SizedBox(height: 15),
        _buildPromoBox(context),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSearch(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    Divider divider() => Divider(height: 1, color: onSurface.withOpacity(0.12));

    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.yellow, width: 3),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.search, size: 22, color: onSurface.withOpacity(0.8)),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _destinationController,
                    style: TextStyle(color: onSurface),
                    decoration: InputDecoration(
                      hintText: "Where are you going?",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: onSurface.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          divider(),
          InkWell(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: _selectBookingDate ?? today,
                firstDate: today,
                lastDate: twoWeeksLater,
              );
              if (pickedDate != null) {
                setState(() => _selectBookingDate = pickedDate);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      size: 22, color: onSurface.withOpacity(0.8)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectBookingDate == null
                              ? "Any dates"
                              : DateFormat("yyyy-MM-dd")
                              .format(_selectBookingDate!),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: onSurface,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Choose your preferred booking date",
                          style: TextStyle(
                            fontSize: 12,
                            color: onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          divider(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  final destination = _destinationController.text.trim();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AttractionListScreen(
                        destination:
                        destination.isEmpty ? "Your location" : destination,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Search", // ✅ fixed typo
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPromoBox(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Travel more, spend less",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: onBg,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: pbox.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 330,
                child: PromoBoxWidget(data: pbox[index]),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildAttractionSlideView(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Travel in Phnom Penh!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: onBg,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CarouselSlider.builder(
            itemCount: places.length,
            itemBuilder: (context, index, realIndex) {
              final place = places[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AttractionDetailsScreen(plist: place),
                    ),
                  );
                },
                child: AttractionslideDesign(p: place),
              );
            },
            options: CarouselOptions(
              height: 440,
              viewportFraction: 0.9,
              autoPlay: true,
            ),
          ),
        ),
      ],
    );
  }
}
