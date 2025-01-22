// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  // Current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "APPEARANCE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
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
                color: Colors.grey.shade300,
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
                      onSelect: () {
                        setState(() {
                          _themeMode = ThemeMode.light;
                        });
                      },
                    ),
                    Divider(color: Colors.grey.shade400),
                    // Dark Mode Section
                    _buildThemeSection(
                      imagePath: "lib/assets/dark_mode.png",
                      title: "Dark",
                      isSelected: _themeMode == ThemeMode.dark,
                      onSelect: () {
                        setState(() {
                          _themeMode = ThemeMode.dark;
                        });
                      },
                    ),
                    Divider(color: Colors.grey.shade400),
                    // Automatic Mode Section
                    _buildThemeSection(
                      imagePath: "lib/assets/auto_mode.png",
                      title: "Automatic",
                      isSelected: _themeMode == ThemeMode.system,
                      onSelect: () {
                        setState(() {
                          _themeMode = ThemeMode.system;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                color: Colors.white,
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
