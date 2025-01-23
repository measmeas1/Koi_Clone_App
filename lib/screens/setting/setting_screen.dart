// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:assignment/screens/setting/setting_section/about_us_app.dart';
import 'package:assignment/screens/setting/setting_section/appearance_screen.dart';
import 'package:assignment/screens/setting/setting_section/faq_screen.dart';
import 'package:assignment/screens/setting/setting_section/language_screen.dart';
import 'package:assignment/screens/setting/setting_section/term_screen.dart';
import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _buildContainer(Icons.color_lens_outlined, 'Appearance', context,
                  AppearanceScreen()),
              _buildContainer(
                  Icons.language, 'Language', context, LanguageScreen()),
              SizedBox(
                height: 30,
              ),
              _buildContainer(
                  Icons.contact_support_outlined, 'FAQs', context, FaqScreen()),
              _buildContainer(Icons.document_scanner_outlined,
                  'Terms & Condition', context, TermScreen()),
              _buildContainer(
                  Icons.feedback_outlined, 'About Us', context, AboutUsApp())
            ],
          ),
        ));
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    title: Center(
        child: Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Text(
        "SETTINGS",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    )),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
      onPressed: () {
        // Go back to the home page (or pop the current route from the navigation stack)
        Navigator.pop(context);
      },
    ),
  );
}

Widget _buildContainer(
    IconData icon, String label, BuildContext context, Widget tapScreen) {
  ThemeMode _mode = context.watch<ThemeLogic>().mode;
  Color containerColor =
      _mode == ThemeMode.dark ? Colors.grey[900]! : Colors.grey[300]!;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => tapScreen),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: Colors.grey.shade500,
                ), // Smaller Icon
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ), // Smaller Text
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    ),
  );
}
