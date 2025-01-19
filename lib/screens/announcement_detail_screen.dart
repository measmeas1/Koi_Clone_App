// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  // final String subtitle;
  // final String? price;

  const AnnouncementDetailScreen({
    // required this.imageUrl,
    // required this.title,
    // required this.subtitle,
    // this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text(
            "NEW PROMOTION",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700,)),
      ),
    );
  }
}
