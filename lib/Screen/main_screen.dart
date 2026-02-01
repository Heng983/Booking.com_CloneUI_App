import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Booking_screen.dart';
import 'package:hotel_app/Screen/ProfileScreen.dart';
import 'package:hotel_app/Screen/Save_screen.dart';
import 'package:hotel_app/Screen/homescreen.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

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
    return MoltenBottomNavigationBar(
      domeCircleColor: AppColors.blueColor,
      domeCircleSize: 50,
      selectedIndex: _currentIndex,
      onTabChange: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      tabs: [
        MoltenTab(
          icon: Icon(Icons.search_rounded),
          selectedColor: AppColors.white,
        ),
        MoltenTab(
            icon: Icon(Icons.bookmark),
          selectedColor: AppColors.white,
        ),
        MoltenTab(
          icon: Icon(Icons.luggage_outlined),
          selectedColor: AppColors.white,
        ),
        MoltenTab(
          icon: Icon(Icons.person_2_outlined),
          selectedColor: AppColors.white,
        ),
      ],
    );
  }
}
