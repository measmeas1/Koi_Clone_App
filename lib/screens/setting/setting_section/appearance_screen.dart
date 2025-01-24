// ignore_for_file: prefer_const_constructors, prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  // Current theme mode

  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMainSection(_themeMode)
    );
  }
 
    AppBar _buildAppBar() {
    return AppBar(
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text(
            "APPEARANCE",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
      ),
    );
  }

  Widget _buildMainSection(ThemeMode _themeMode){
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8),
              child: Text(
                "APPEARANCE",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
              ),
            ),
            // Main container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: _themeMode == ThemeMode.dark ? Colors.grey[900] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Light Mode Section
                    _buildThemeSection(
                      imagePath: "lib/assets/light_mode.png",
                      title: "Light",
                      isSelected: _themeMode == ThemeMode.light,
                      onSelect: () => context.read<ThemeLogic>().changeToLight(),
                    ),
                    // Dark Mode Section
                    _buildThemeSection(
                      imagePath: "lib/assets/dark_mode.png",
                      title: "Dark",
                      isSelected: _themeMode == ThemeMode.dark,
                      onSelect: () => context.read<ThemeLogic>().changeToDark(),
                    ),

                    // Automatic Mode Section
                    _buildThemeSection(
                      imagePath: "lib/assets/auto_mode.png",
                      title: "Automatic",
                      isSelected: _themeMode == ThemeMode.system,
                      onSelect: () => context.read<ThemeLogic>().changeToSystem(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
  // Helper method to build a theme section
  Widget _buildThemeSection({
    required String imagePath,
    required String title,
    required bool isSelected,
    required VoidCallback onSelect,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onSelect,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image and text wrapped with GestureDetector
            Container(
              width: 80,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              onChanged: (value) => onSelect(),
            ),
          ],
        ),
      ),
    );
  }
}
