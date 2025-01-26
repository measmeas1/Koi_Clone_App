// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field, use_key_in_widget_constructors

import 'package:assignment/data/data.dart';
import 'package:assignment/screens/announcements/announcement_detail_screen.dart';
import 'package:assignment/screens/announcements/announcement_screen.dart';
import 'package:assignment/screens/announcements/announcement_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _balance = 0.0;
  int _bubbles = 0;

  final List<String> _images = [
    'lib/assets/koi_3.jpg',
    'lib/assets/koi_2.jpg',
    'lib/assets/red_green.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    String greetingMessage = _getGreetingMessage();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarousel(),
            const SizedBox(height: 25),

            // Greetings Section
            _buildGreetingSection(greetingMessage),
            const SizedBox(height: 40),

            _buildPickupAndDelivery(),

            SizedBox(
              height: 40,
            ),

            _buildAnnouncementsSection()
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Indicators below the image
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 25 : 25,
              height: 5,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.orange.shade600
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGreetingSection(String greetingMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${greetingMessage} User',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {},
                child: Column(
                  children: [
                    Text(
                      "BALANCE >",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      "\$${_balance.toStringAsFixed(2)}",
                      // "\$${_balance.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight
                            .bold, // Optional: color to indicate it's clickable
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {},
                child: Column(
                  children: [
                    Text(
                      "BUBBLES",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _bubbles.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold, // Optional: color to indicate it's clickable
                          ),
                        ),
                        Icon(Icons.bubble_chart_sharp)
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Example action: Update balance and bubbles
                  setState(() {
                    _balance += 10;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text(
                  "Top Up",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              GestureDetector(
                  onTap: () {
                    // Example action: Increment bubbles
                    setState(() {
                      _bubbles++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade600,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Image.asset(
                      'lib/assets/Flash-icon.png',
                      width: 20,
                      height: 24,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPickupAndDelivery() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconColumn(
            imageUrl: 'lib/assets/pickup_icon.png',
            label: 'Pickup',
            alignment: Alignment.topLeft,
          ),
          const SizedBox(width: 10),
          _buildIconColumn(
            imageUrl: 'lib/assets/delivery_icon.png',
            label: 'Delivery',
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }

  Widget _buildIconColumn({
    required String imageUrl,
    required String label,
    required Alignment alignment,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              left: alignment == Alignment.topLeft ? -10 : null,
              right: alignment == Alignment.topRight ? -10 : null,
              top: alignment == Alignment.topLeft ? -35 : -34,
              child: Image.asset(
                imageUrl,
                width: 200,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildAnnouncementsSection() {
    List<Map<String, dynamic>> validAnnouncements =
        announcements.where((announcement) {
      return announcement["imageUrl"] != null &&
          announcement["imageUrl"].isNotEmpty &&
          announcement["title"] != null &&
          announcement["title"].isNotEmpty &&
          announcement["subtitle"] != null &&
          announcement["subtitle"].isNotEmpty &&
          (announcement["sections"] != null &&
              announcement["sections"].isNotEmpty);
    }).toList();

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: validAnnouncements.length + 1, // Add one for the title and "See All" link
        itemBuilder: (context, index) {
          // Check if we are at the first item (Announcements title + See All link)
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Announcements",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  GestureDetector(
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16, color: Colors.orange.shade700),
                    ),
                    onTap: () {
                      // For example, navigate to a full announcement screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnnouncementScreen(
                                  announcements: validAnnouncements)));
                    },
                  ),
                ],
              ),
            );
          } else {
            // If not the first item, return an AnnouncementCard
            final announcement =
                validAnnouncements[index - 1]; // Adjust index to skip the title row
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnnouncementCard(
                imageUrl: announcement["imageUrl"]!,
                title: announcement["title"]!,
                subtitle: announcement["subtitle"],
                onOrderPressed: () {},
                onCardPressed: () {
                  // Navigate to a new screen when the card is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnnouncementDetailScreen(
                        announcement: announcement,
                      ), // Replace with the screen you want
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning!";
    } else if (hour < 17) {
      return "Good Afternoon!";
    } else {
      return "Good Evening!";
    }
  }
}
