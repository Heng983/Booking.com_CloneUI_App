import 'package:flutter/material.dart';
import 'package:hotel_app/Theme_logic.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:provider/provider.dart';

class DevicePreferenceScreen extends StatelessWidget {
  const DevicePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeIndex = context.watch<ThemeLogic>().themeIndex;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    String themeText = themeIndex == 0
        ? "Use device settings"
        : themeIndex == 1
        ? "Light theme"
        : "Dark theme";

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              "Device settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          ListTile(
            title: Text(
              "Appearance",
              style: TextStyle(color: cs.onBackground),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  themeText,
                  style: TextStyle(color: cs.onBackground.withOpacity(0.75)),
                ),
                Icon(Icons.chevron_right, color: cs.onBackground),
              ],
            ),
            onTap: () => _showAppearanceSheet(context),
          ),

          Divider(color: cs.onBackground.withOpacity(0.12)),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),

          ListTile(
            title: Text("Privacy Policy", style: TextStyle(color: cs.onBackground)),
            onTap: () {},
          ),
          ListTile(
            title: Text("Manage privacy setting", style: TextStyle(color: cs.onBackground)),
            onTap: () {},
          ),
          ListTile(
            title: Text("App version v1.0", style: TextStyle(color: cs.onBackground)),
          ),
        ],
      ),
    );
  }

  void _showAppearanceSheet(BuildContext context) {
    final themeLogic = context.read<ThemeLogic>();
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appearance",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 20),

              RadioListTile<int>(
                value: 1,
                groupValue: themeLogic.themeIndex,
                title: Text("Light theme", style: TextStyle(color: cs.onSurface)),
                activeColor: AppColors.blueColor,
                onChanged: (_) {
                  themeLogic.changetoLightmode();
                  Navigator.pop(context);
                },
              ),

              RadioListTile<int>(
                value: 2,
                groupValue: themeLogic.themeIndex,
                title: Text("Dark theme", style: TextStyle(color: cs.onSurface)),
                activeColor: AppColors.blueColor,
                onChanged: (_) {
                  themeLogic.changetoDarkmode();
                  Navigator.pop(context);
                },
              ),

              RadioListTile<int>(
                value: 0,
                groupValue: themeLogic.themeIndex,
                title: Text("Use device settings", style: TextStyle(color: cs.onSurface)),
                activeColor: AppColors.blueColor,
                onChanged: (_) {
                  themeLogic.changetoSystemode();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
