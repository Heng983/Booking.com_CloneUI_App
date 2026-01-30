import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/color.dart';

Future<String?> showLocationSheet({
  required BuildContext context,
  required String title,
  required List<String> popularRoutes,
  required List<String> locations,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BusLocationCar(
      title: title,
      popularRoutes: popularRoutes,
      locations: locations,
    ),
  );
}

class BusLocationCar extends StatefulWidget {
  const BusLocationCar({
    super.key,
    required this.title,
    required this.popularRoutes,
    required this.locations,
  });

  final String title;
  final List<String> popularRoutes;
  final List<String> locations;

  @override
  State<BusLocationCar> createState() => _BusLocationCarState();
}

class _BusLocationCarState extends State<BusLocationCar> {
  final TextEditingController _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    final query = _search.text.trim().toLowerCase();

    final filteredPopular = widget.popularRoutes
        .where((e) => e.toLowerCase().contains(query))
        .toList();

    final filteredLocations = widget.locations
        .where((e) => e.toLowerCase().contains(query))
        .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.88,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            border: isDark
                ? Border.all(color: Colors.white.withOpacity(0.08))
                : null,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // handle bar
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: onSurface.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),

              const SizedBox(height: 10),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: onSurface,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: onSurface),
                    ),
                  ],
                ),
              ),

              // Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _search,
                  onChanged: (_) => setState(() {}),
                  style: TextStyle(color: onSurface),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: onSurface.withOpacity(0.7)),
                    hintText: "Search",
                    hintStyle: TextStyle(color: onSurface.withOpacity(0.45)),
                    filled: true,
                    fillColor: isDark
                        ? onSurface.withOpacity(0.08)
                        : const Color(0xFFF3F3F3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  children: [
                    const SizedBox(height: 6),

                    Text(
                      "Popular Routes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),

                    ...filteredPopular.map(
                          (text) => _routeTile(
                        context,
                        text,
                        onTap: () => Navigator.pop(context, text),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      "Locations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),

                    ...filteredLocations.map(
                          (text) => _locationTile(
                        context,
                        text,
                        onTap: () => Navigator.pop(context, text),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _routeTile(BuildContext context, String text, {required VoidCallback onTap}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.10)
              : Colors.black.withOpacity(0.10),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withOpacity(isDark ? 0.18 : 0.12),
          child: const Icon(Icons.route, color: AppColors.blueColor),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: onSurface.withOpacity(0.5)),
      ),
    );
  }

  Widget _locationTile(BuildContext context, String text, {required VoidCallback onTap}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.10)
              : Colors.black.withOpacity(0.10),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withOpacity(isDark ? 0.18 : 0.12),
          child: const Icon(Icons.location_on, color: AppColors.blueColor),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: onSurface.withOpacity(0.5)),
      ),
    );
  }
}
