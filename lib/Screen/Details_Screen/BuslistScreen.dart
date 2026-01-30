import 'package:flutter/material.dart';
import 'package:hotel_app/model/Bus_model.dart';
import 'package:hotel_app/widgets/Buslist_design.dart';
import '../../widgets/color.dart';

class Buslistscreen extends StatefulWidget {
  const Buslistscreen({
    super.key,
    required this.fromLocation,
    required this.toDestination,
  });

  final String fromLocation;
  final String toDestination;

  @override
  State<Buslistscreen> createState() => _BuslistScreenState();
}

class _BuslistScreenState extends State<Buslistscreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopSearch(context),
            _buildActionButton(context),
            const SizedBox(height: 8),
            Expanded(child: _buildBusListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSearch(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.yellow, width: 2),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(999),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(Icons.arrow_back, color: onSurface),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "${widget.fromLocation} ⇄ ${widget.toDestination}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(onSurface, Icons.sort, "Sort"),
          _actionButton(onSurface, Icons.tune, "Filter"),
          _actionButton(onSurface, Icons.map, "Map"),
        ],
      ),
    );
  }

  Widget _actionButton(Color onSurface, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: onSurface.withOpacity(0.85)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: onSurface.withOpacity(0.85),
          ),
        ),
      ],
    );
  }

  Widget _buildBusListView() {
    return ListView.builder(
      itemCount: blist.length,
      itemBuilder: (_, index) {
        final buslist = blist[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: BuslistDesign(blist: buslist),
          ),
        );
      },
    );
  }
}
