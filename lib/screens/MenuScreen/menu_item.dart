// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuItem extends StatefulWidget {
  final Map<String, dynamic> item;
  const MenuItem({super.key, required this.item});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item[
            "name"]), // Dynamically set the title based on the selected item
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // Ensures the container takes the full width
          decoration: BoxDecoration(
            color: _themeMode == ThemeMode.dark
                ? Colors.black
                : Colors.grey.shade200,
                boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double
                    .infinity, // Ensure this container also takes full width
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.item["screen"]),
                    fit: BoxFit
                        .cover, // This ensures the image covers the entire area
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.item["name"], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
