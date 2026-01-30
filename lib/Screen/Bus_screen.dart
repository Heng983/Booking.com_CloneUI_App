import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/BuslistScreen.dart';
import 'package:hotel_app/model/Bus_model.dart';
import 'package:hotel_app/widgets/color.dart';

import '../widgets/BusLocationCard.dart';
import '../widgets/Bus_DateCard.dart';
import '../widgets/Bus_locationCard.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  DateTime get today => DateTime.now();

  String? currentLocation;
  String? destination;

  DateTime? departDate;
  DateTime? returnDate;

  String? fromLocation;
  String? toDestination;

  String _formatDate(DateTime date) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${weekdays[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                _buildCurrentLocation(context),
                const SizedBox(height: 16),
                _buildCardDate(context),
                const SizedBox(height: 8),
                _buildSearchButton(context),
                const SizedBox(height: 12),
                _buildBusSlide(
                  context: context,
                  title: "Vireak Buntham Bus",
                  items: vet,
                ),
                const SizedBox(height: 12),
                _buildBusSlide(
                  context: context,
                  title: "LarryTa Bus",
                  items: labus,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentLocation(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
        ],
        border: isDark ? Border.all(color: Colors.white.withOpacity(0.08)) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: BusLocationCard(
              title: currentLocation ?? "Choose your location",
              primary: onSurface,
              onTap: _pickFromLocation,
            ),
          ),
          const SizedBox(width: 12),
          Icon(Icons.swap_horiz, color: AppColors.blueColor),
          const SizedBox(width: 12),
          Expanded(
            child: BusLocationCard(
              title: destination ?? "Choose your destination",
              primary: onSurface,
              onTap: _pickDestination,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDate(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    return Row(
      children: [
        Expanded(
          child: BusDatecard(
            label: "Departure date",
            value: departDate != null ? _formatDate(departDate!) : "Add Date",
            primary: onSurface.withOpacity(0.6),
            onTap: () async {
              final picked = await _pickDate(context, departDate);
              if (picked != null) setState(() => departDate = picked);
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BusDatecard(
            label: "Return date",
            value: returnDate != null ? _formatDate(returnDate!) : "Add Date",
            primary: onSurface.withOpacity(0.6),
            onTap: () async {
              final picked = await _pickDate(context, returnDate);
              if (picked != null) setState(() => returnDate = picked);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Buslistscreen(
                fromLocation: currentLocation ?? "Choose your location",
                toDestination: destination ?? "Choose your destination",
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          shape: const StadiumBorder(),
        ),
        child: const Text(
          'Search',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _pickDate(BuildContext context, DateTime? initial) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: initial ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
  }

  Widget _buildBusSlide({
    required BuildContext context,
    required String title,
    required List<dynamic> items,
  }) {
    final theme = Theme.of(context);
    final onBg = theme.colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: onBg,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1.0,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              aspectRatio: 1 / 1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index, pageViewIndex) {
              final item = items[index];
              return InkWell(
                onTap: () {},
                child: Card(
                  color: theme.colorScheme.surface,
                  elevation: theme.brightness == Brightness.dark ? 0 : 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.img,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _pickFromLocation() async {
    final result = await showLocationSheet(
      context: context,
      title: 'From location',
      popularRoutes: const [
        'Phnom Penh → Siem Reap',
        'Siem Reap → Phnom Penh',
        'Phnom Penh → Battambang',
        'Battambang → Phnom Penh',
        'Phnom Penh → Kampot',
      ],
      locations: const [
        'Siem Reap',
        'Phnom Penh',
        'Kampong Cham',
        'Banloung - Ratanakiri',
        'Sihanoukville',
        'Suong',
      ],
    );

    if (result != null) {
      setState(() {
        currentLocation = result;
        fromLocation = result;
      });
    }
  }

  Future<void> _pickDestination() async {
    final result = await showLocationSheet(
      context: context,
      title: 'To destination',
      popularRoutes: const [
        'Phnom Penh → Siem Reap',
        'Siem Reap → Phnom Penh',
        'Phnom Penh → Battambang',
        'Battambang → Phnom Penh',
        'Phnom Penh → Kampot',
      ],
      locations: const [
        'Siem Reap',
        'Phnom Penh',
        'Kampong Cham',
        'Banloung - Ratanakiri',
        'Sihanoukville',
        'Suong',
      ],
    );

    if (result != null) {
      setState(() {
        destination = result;
        toDestination = result;
      });
    }
  }
}
