import 'package:flutter/material.dart';
import '../widgets/EmptyTripsState.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    const bookingBlue = Color(0xFF003580);
    const borderBlue = Color(0xFF1A73E8);

    final tabBarBg = isDark ? const Color(0xFF121212) : const Color(0xFFF2F2F2);
    final pillBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final unselected = isDark ? Colors.white70 : Colors.black87;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bookingBlue,
          elevation: 0,
          title: const Text(
            "Trips",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 6),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(62),
            child: Container(
              color: tabBarBg,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                  labelColor: bookingBlue,
                  unselectedLabelColor: unselected,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  indicator: BoxDecoration(
                    color: pillBg,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: borderBlue, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(isDark ? 0.35 : 0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  // padding inside each tab "slot"
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 4,
                  ),

                  tabs: const [
                    Tab(text: "Active"),
                    Tab(text: "Past"),
                    Tab(text: "Canceled"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            EmptyTripsState(),
            EmptyTripsState(),
            EmptyTripsState(),
          ],
        ),
      ),
    );
  }
}
