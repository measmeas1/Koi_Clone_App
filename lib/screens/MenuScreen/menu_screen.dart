// ignore_for_file: prefer_const_constructors

import 'package:assignment/screens/MenuScreen/menu_item.dart';
import 'package:assignment/screens/MenuScreen/menu_item_data.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = menuItems;
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuItem(item: item))
              );
            },
            child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["name"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item["price"],
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                ],
              ),
            ),
            Image.asset(item["item"])
          ],
        ),
      ),
    ),
          );
        }
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Center(
        child: Text(
          "MENU",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
