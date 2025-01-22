// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment/screens/AboutUsApp.dart';
import 'package:assignment/screens/appearance_screen.dart';
import 'package:assignment/screens/language_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              Navigator.pop(
                  context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              _buildContainer(Icons.app_settings_alt_rounded, 'Appearance', context, AppearanceScreen()),
              _buildContainer(Icons.language, 'Language', context, LanguageScreen()),

              SizedBox(height: 30,),

              _buildContainer(Icons.format_quote, 'FAQs', context, AboutUsApp()),
              _buildContainer(Icons.theater_comedy, 'Terms & Condition', context, AboutUsApp()),
              _buildContainer(Icons.format_quote, 'About Us', context, AboutUsApp())
            ],
          ),
        ));
  }
}

Widget _buildContainer(IconData icon, String label, BuildContext context, Widget tapScreen) {
  return GestureDetector(
    onTap: (){
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
          color: Colors.grey[300],
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
                Icon(icon, size: 22, color: Colors.grey.shade500,), // Smaller Icon
                      SizedBox(width: 10),
                      Text(
                        label,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold), // Smaller Text
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 18,)
          ],
        ),
      ),
    ),
  );
}
