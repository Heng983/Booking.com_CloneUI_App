import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/CarlistScreen.dart';
import 'package:hotel_app/model/CarModel.dart';
import 'package:hotel_app/model/CarRental_brand.dart';
import 'package:hotel_app/widgets/CarRental_widget.dart';
import 'package:hotel_app/widgets/carShow_SlideDesgin.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:intl/intl.dart';

class CarRentalScreen extends StatefulWidget {
  const CarRentalScreen({super.key});

  @override
  State<CarRentalScreen> createState() => _CarRentalScreenState();
}

class _CarRentalScreenState extends State<CarRentalScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  DateTimeRange? _selectedDateRange;
  DateTime get today => DateTime.now();
  DateTime get twoweeklater => today.add(const Duration(days: 20));

  @override
  void dispose() {
    _destinationController.dispose();
    _ageController.dispose();
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildCarRentalCompany(context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildCarModel(context),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSearch(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    Divider divider() =>
        Divider(height: 1, color: onSurface.withOpacity(0.12));
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
                      hintText: "Current location",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
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
              final pickedRange = await showDateRangePicker(
                context: context,
                firstDate: today,
                lastDate: today.add(const Duration(days: 365)),
                initialDateRange: _selectedDateRange ??
                    DateTimeRange(start: today, end: twoweeklater),
              );

              if (pickedRange != null) {
                setState(() => _selectedDateRange = pickedRange);
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
                          _selectedDateRange != null
                              ? '${DateFormat('yyyy-MM-dd').format(_selectedDateRange!.start)}'
                              ' - '
                              '${DateFormat('yyyy-MM-dd').format(_selectedDateRange!.end)}'
                              : 'Select your booking date',
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
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.person_outline,
                    size: 22, color: onSurface.withOpacity(0.8)),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: onSurface),
                    decoration: InputDecoration(
                      hintText: "Driver's age: 20-65",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
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
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
                  final startDate = _selectedDateRange?.start ?? today;
                  final endDate = _selectedDateRange?.end ?? twoweeklater;
                  final dateFormatter = DateFormat('EEE, MMM d');
                  final dateRange =
                      '${dateFormatter.format(startDate)} - ${dateFormatter.format(endDate)}';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CarListScreen(
                        destination:
                        destination.isEmpty ? "Your location" : destination,
                        dateRange: dateRange,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Search",
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

  Widget _buildCarRentalCompany(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "Popular rental car companies",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: onBg,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: logo.map<Widget>((c) => CarrentalWidget(logo: c)).toList(),
        ),
      ],
    );
  }

  Widget _buildCarModel(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Text(
          "Car Rental",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: onBg,
          ),
        ),
        const SizedBox(height: 12),
        CarouselSlider.builder(
          itemCount: carshow.length,
          itemBuilder: (context, index, realIndex) {
            final car = carshow[index];
            return CarshowSlidedesign(carshow: car);
          },
          options: CarouselOptions(
            height: 390,
            viewportFraction: 0.9,
            aspectRatio: 4 / 3,
            autoPlay: true,
          ),
        ),
      ],
    );
  }
}
