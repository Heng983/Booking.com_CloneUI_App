
import 'package:flutter/material.dart';

class Promobox {
  final String title;
  final String subtitle;
  final IconData icon;

  Promobox({
    required this.title,
    required this.subtitle,
    required this.icon,
});
}

List<Promobox> pbox = [
 Promobox(
   title: "10% discounts on\nstays",
   subtitle: "Enjoy discounts at\nparticipating properties\nworldwide.",
     icon: Icons.percent,
 ),
  Promobox(
    title: "10% discounts on\nrental cars",
    subtitle: "Save on select rental cars.",
    icon: Icons.directions_car_filled_outlined,
  ),
  Promobox(
    title: "10-15% discounts on\nstays",
    subtitle: "Complete 5 booking to\nunlock Genius Level 2.",
    icon: Icons.percent,
  ),
];