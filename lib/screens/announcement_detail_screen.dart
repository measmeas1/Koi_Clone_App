// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatelessWidget {

  final Map<String, dynamic> announcement; // To receive the selected announcement

  const AnnouncementDetailScreen({required this.announcement, Key? key});

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
    body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(announcement["imageUrl"]!, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              announcement["title"]!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              announcement["subtitle"]!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            if (announcement["price"] != null)
              Text(
                "Price: ${announcement["price"]}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            // Add any other details you want to display here
          ],
        ),
      ),
    );
  }
}

// return Scaffold(
//       appBar: AppBar(
//         title: Text("Announcement Details"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
//           onPressed: () {
//             Navigator.pop(context);  // Go back to the previous screen
//           },
//         ),
//       ),