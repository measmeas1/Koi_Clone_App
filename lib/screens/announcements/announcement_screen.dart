// ignore_for_file: prefer_const_constructors

import 'package:assignment/screens/MenuScreen/order_screen.dart';
import 'package:assignment/screens/announcements/announcement_detail_screen.dart';
import 'package:assignment/screens/announcements/announcement_card.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> announcements;

  const AnnouncementScreen({required this.announcements, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> validAnnouncements = announcements.where((announcement) {
      return announcement["imageUrl"] != null && 
             announcement["imageUrl"].isNotEmpty &&
             announcement["title"] != null &&
             announcement["title"].isNotEmpty &&
             announcement["subtitle"] != null &&
             announcement["subtitle"].isNotEmpty &&
             (announcement["sections"] != null && announcement["sections"].isNotEmpty);
    }).toList();
    return Scaffold(
      appBar: _buildAppbar(context), 
      body: _buildBody(validAnnouncements)
    );
  }
}

AppBar _buildAppbar(BuildContext context) {
  return AppBar(
    title: Center(
        child: Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Text(
        "ANNOUNCEMENTS",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    )),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
      onPressed: () {
        // Go back to the home page (or pop the current route from the navigation stack)
        Navigator.pop(
            context); // This will take you back to the previous screen (Home page in this case)
      },
    ),
  );
}

Widget _buildBody(List<Map<String, dynamic>> announcements) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: ListView.builder(
      padding: EdgeInsets.only(top: 22),
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        final announcement = announcements[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: AnnouncementCard(
            imageUrl: announcement["imageUrl"]!,
            title: announcement["title"]!,
            subtitle: announcement["subtitle"]!,
            onOrderPressed: () {
              final order = announcement["order"][0]; // Assuming there's only one order per item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderScreen(item: order),
                ),
              );
            },
            onCardPressed: () {
              // Handle card press action (e.g., navigate to details)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnnouncementDetailScreen(
                            announcement: announcement,
                          )));
            },
          ),
        );
      },
    ),
  );
}
