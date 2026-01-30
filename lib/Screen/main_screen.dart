import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Booking_screen.dart';
import 'package:hotel_app/Screen/ProfileScreen.dart';
import 'package:hotel_app/Screen/Save_screen.dart';
import 'package:hotel_app/Screen/homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildbottomNavigationBar(),
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        HomeScreen(),
        SaveScreen(),
        BookingScreen(),
        Profilescreen(),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildbottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: "Search",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Save"),
        BottomNavigationBarItem(
          icon: Icon(Icons.luggage_outlined),
          label: "Bookings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: "My account",
        ),
      ],
    );
  }
}
