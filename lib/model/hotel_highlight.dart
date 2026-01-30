import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelHighlight {
  final IconData icon;
  final String title;
  final String subtitle;

  HotelHighlight({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

  final List<HotelHighlight> highLights = [
    HotelHighlight(
        icon: Icons.local_cafe_outlined,
        title: 'Breakfast',
      subtitle: "Free breakfast",
    ),
    HotelHighlight(
      icon: Icons.local_parking_outlined,
      title: 'Parking',
      subtitle: "Free Parking, private parking",
    ),
    HotelHighlight(
        icon: Icons.pool_outlined,
        title: "Swimming pool",
        subtitle: "Out pool"
    ),
    HotelHighlight(
      icon: Icons.wifi,
      title: 'Free Wifi',
      subtitle: "Internet",
    ),
    HotelHighlight(
      icon: Icons.terrain_outlined,
      title: 'Views',
      subtitle: "City view",
    ),
  ];