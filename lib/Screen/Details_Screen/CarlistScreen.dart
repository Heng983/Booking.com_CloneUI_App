import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/CarDetailsScreen.dart';
import 'package:hotel_app/model/CarModel.dart';
import 'package:hotel_app/widgets/carShow_SlideDesgin.dart';

import '../../widgets/carlist_design.dart';
import '../../widgets/color.dart';

class CarListScreen extends StatefulWidget{
  const CarListScreen({
    super.key,
    required this.destination,
    required this.dateRange,
  });

  final String destination;
  final String dateRange;

  @override
  State<CarListScreen> createState() => _CarListScreen();
}

class _CarListScreen extends State<CarListScreen>{

  String get checkInText {
    final parts = widget.dateRange.split('-');
    if (parts.isEmpty) return '';
    return parts.first.trim();
  }


  String get checkOutText {
    final parts = widget.dateRange.split('-');
    if (parts.length < 2) return '';
    return parts.last.trim();
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              _buildTopSearch(context),
              _buildActionButton(),
              const SizedBox(height: 8),
              Expanded(child: _buildCarListView()),
            ],
          )
      ),
    );
  }

  Widget _buildTopSearch(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.yellow, width: 2),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "${widget.destination} . ${widget.dateRange}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(Icons.sort, "Sort"),
          _actionButton(Icons.tune, "Fliter"),
          _actionButton(Icons.map, "Map"),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
  Widget _buildCarListView() {
    return ListView.builder(
      itemCount: carlist.length,
      itemBuilder: (_, index) {
        final clist = carlist[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CarDetailsscreen(
                      carlist: clist,
                      checkInText: checkInText,
                      checkOutText: checkOutText,
                  ),
                  ),
              );
            },
            child: CarlistDesign(carlist: clist),
          ),
        );
      },
    );
  }
}