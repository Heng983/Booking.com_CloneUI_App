import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/Details_Screen/DevicePreferenceScreen.dart';
import 'package:hotel_app/Screen/Details_Screen/SignIn_choiceScreen.dart';
import 'package:hotel_app/widgets/color.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            // Keep booking blue always (same like Booking.com)
            color: AppColors.blueColor,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              left: 16,
              right: 16,
              bottom: 18,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.help_outline_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.yellow, width: 2),
                  ),
                  child: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                    size: 44,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  "Sign in to manage your trip and save 10% or\nmore on select stays and rental cars",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SigninChoiceScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.tabSelectedBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Sign in or register",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: cs.outline.withOpacity(0.5),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.settings, size: 28, color: cs.onSurface),
                title: Text(
                  "Device preference",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: cs.onSurface,
                  ),
                ),
                trailing: Icon(Icons.chevron_right, size: 30, color: cs.onSurface),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DevicePreferenceScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
