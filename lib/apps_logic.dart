import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/homescreen.dart';
import 'package:hotel_app/Screen/main_screen.dart';
import 'package:hotel_app/Theme_logic.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:provider/provider.dart';

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;
    return MaterialApp(
      home: MainScreen(),
      themeMode: themeIndex == 0
          ? ThemeMode.system
          : themeIndex == 1
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: const Color(0xFFF2F2F2),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: AppColors.blueColor,
      //   unselectedItemColor: Colors.black54,
      // ),

      dividerColor: const Color(0xFFEAEAEA),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0F1115),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF151821),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),

      cardColor: const Color(0xFF151821),
      dividerColor: const Color(0xFF2A2F3A),
    );
  }
}
