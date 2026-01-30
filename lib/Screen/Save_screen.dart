import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/color.dart';

class SaveScreen extends StatelessWidget{
  const SaveScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text(
          "Saved",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.white,
          ),
        ),
      ),
    );

  }
}