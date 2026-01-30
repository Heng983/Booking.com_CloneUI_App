import 'package:flutter/material.dart';
import 'package:hotel_app/model/CarModel.dart';
import 'package:hotel_app/widgets/color.dart';

class CarDetailsscreen extends StatelessWidget{
  const CarDetailsscreen({
    super.key,
    required this.carlist,
    required this.checkInText,
    required this.checkOutText,
  });

  final Carlist carlist;
  final String checkInText;
  final String checkOutText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text(
          carlist.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const[
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Icon(Icons.ios_share_outlined),
          SizedBox(width: 12),
        ],
      ),
      bottomNavigationBar:
      SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Select car",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          )
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildPhoto(),
          const SizedBox(height: 16),
          _buildCarInfo()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          carlist.name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Icon(Icons.star_border, color: Colors.amber, size: 18),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "Genius",
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                carlist.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          carlist.location,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Excellent location!",
          style: TextStyle(
            fontSize: 13,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _buildPhoto() {
    return GestureDetector(
      onTap: () {
        // open gallery or details
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          carlist.img,
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCarInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Check-in',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      checkInText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Check-out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      checkOutText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}