// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment/screens/account_screen.dart';
import 'package:assignment/screens/history_screen.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/MenuScreen/menu_screen.dart';
import 'package:flutter/material.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key});

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
 int _currentIndex = 0;

  // List of screens to display based on selected BottomNavigationBar index
  final List<Widget> _screens = [
    HomeScreen(), 
    MenuScreen(),
    HistoryScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu_sharp), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: 'Account'),
        ],
        selectedItemColor: Colors.orange,
      ),
    );
  }
}