import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_app/Screen/Attraction_screen.dart';
import 'package:hotel_app/Screen/Bus_screen.dart';
import 'package:hotel_app/Screen/Car_rental_screen.dart';
import 'package:hotel_app/Screen/Details_Screen/HotelScreen.dart';
import 'package:hotel_app/Screen/Details_Screen/Hotel_details_screen.dart';
import 'package:hotel_app/model/hotels.dart';
import 'package:hotel_app/widgets/button/Counter_row.dart';
import 'package:hotel_app/widgets/Slide_discount.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:hotel_app/widgets/toptap.dart';
import 'package:intl/intl.dart';
import 'package:hotel_app/widgets/Silde_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  void setTab(int index) => setState(() => selectedTab = index);

  final TextEditingController _destinationController = TextEditingController();

  DateTimeRange? _selectedDateRange;
  DateTime get today => DateTime.now();
  DateTime get twoweeklater => today.add(const Duration(days: 20));

  int _rooms = 1;
  int _adults = 2;
  int _children = 0;
  bool _withPets = false;

  String get guestLabel {
    final roomsLabel = '$_rooms Room${_rooms > 1 ? 's' : ''}, ';
    final adultsLabel = '$_adults Adult${_adults > 1 ? 's' : ''}, ';
    final childrenLabel = '$_children Child${_children > 1 ? 'ren' : ''}';
    final petsLabel = _withPets ? ', with Pets' : '';
    return roomsLabel + adultsLabel + childrenLabel + petsLabel;
  }

  int selectedRooms = 1;
  int selectedAdults = 2;
  int selectedChildren = 0;

  String get checkInText {
    if (_selectedDateRange == null) return '';
    return DateFormat('EEE, MMM d').format(_selectedDateRange!.start);
  }

  String get checkOutText {
    if (_selectedDateRange == null) return '';
    return DateFormat('EEE, MMM d').format(_selectedDateRange!.end);
  }

  String get roomsGuests {
    return '$selectedRooms room, $selectedAdults adults, $selectedChildren children';
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: IndexedStack(
        index: selectedTab,
        children: [
          _buildScreen(context),
          const CarRentalScreen(),
          const BusScreen(),
          const AttractionScreen(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Booking.com",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chat_bubble_outline),
        ),
        const SizedBox(width: 4),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
        const SizedBox(width: 12),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TopTab(
                  label: "Stays",
                  icon: Icons.bed,
                  isSelected: selectedTab == 0,
                  onTap: () => setTab(0),
                ),
                const SizedBox(width: 8),
                TopTab(
                  label: "Car rental",
                  icon: Icons.directions_car,
                  isSelected: selectedTab == 1,
                  onTap: () => setTab(1),
                ),
                const SizedBox(width: 8),
                TopTab(
                  label: "Bus",
                  icon: Icons.directions_bus,
                  isSelected: selectedTab == 2,
                  onTap: () => setTab(2),
                ),
                const SizedBox(width: 8),
                TopTab(
                  label: "Attraction",
                  icon: Icons.attractions_outlined,
                  isSelected: selectedTab == 3,
                  onTap: () => setTab(3),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      width: 250,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.colorScheme.surface),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/photos/user_img.jpg"),
                ),
                const SizedBox(height: 14),
                Text(
                  "Max Verstappen",
                  style: GoogleFonts.moul(
                    fontSize: 18,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red, size: 28,),
            title: Text(
              "Log-out",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          DrawerButtonIcon(

          )
        ],
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildSearch(context),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildHotelSlideView(context),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildDiscountSlideshow(context),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildSearch(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.yellow, width: 3), // keep your yellow
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
          // Destination
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
                      hintText: "Enter your destination",
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
          Divider(height: 1, color: onSurface.withOpacity(0.12)),
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

          Divider(height: 1, color: onSurface.withOpacity(0.12)),
          InkWell(
            onTap: _pickGuest,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.person_outline,
                      size: 22, color: onSurface.withOpacity(0.8)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          guestLabel,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: onSurface,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Select number of rooms, guests, and pets",
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

          Divider(height: 1, color: onSurface.withOpacity(0.12)),

          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              height: 48,
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
                      builder: (_) => HotelScreen(
                        destination:
                        destination.isEmpty ? 'Your destination' : destination,
                        dateRange: dateRange,
                        adults: selectedAdults,
                        rooms: selectedRooms,
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

  Future<void> _pickGuest() async {
    final theme = Theme.of(context);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        int rooms = _rooms;
        int adults = _adults;
        int children = _children;
        bool withPets = _withPets;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurface.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Text(
                      "Select room and guests",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),

                    CounterRow(
                      label: "Rooms",
                      value: rooms,
                      onChanged: (v) => setModalState(() => rooms = v),
                    ),
                    CounterRow(
                      label: "Adults",
                      value: adults,
                      onChanged: (v) => setModalState(() => adults = v),
                    ),
                    CounterRow(
                      label: "Children",
                      subtitle: "Age 0 - 17",
                      value: children,
                      onChanged: (v) => setModalState(() => children = v),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Traveling with pets?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Switch.adaptive(
                          value: withPets,
                          onChanged: (val) =>
                              setModalState(() => withPets = val),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "Assistance animals aren't considered pets.",
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0056B8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _rooms = rooms;
                            _adults = adults;
                            _children = children;
                            _withPets = withPets;
                            selectedRooms = rooms;
                            selectedAdults = adults;
                            selectedChildren = children;
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHotelSlideView(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Popular stays",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: onBg),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CarouselSlider.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index, realIndex) {
              final hotel = hotels[index];
              return GestureDetector(
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
                child: SildeDesign(hotel: hotel),
              );
            },
            options: CarouselOptions(
              height: 385,
              viewportFraction: 0.9,
              aspectRatio: 4 / 3,
              autoPlay: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountSlideshow(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Sale offers",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: onBg),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CarouselSlider.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index, realIndex) {
              final hotel = hotels[index];
              return SildeDiscount(hotel: hotel);
            },
            options: CarouselOptions(
              height: 410,
              viewportFraction: 0.9,
              aspectRatio: 4 / 3,
              autoPlay: true,
            ),
          ),
        ),
      ],
    );
  }
}