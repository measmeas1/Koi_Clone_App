// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:assignment/data/announcements.dart';
import 'package:assignment/widgets/announcement_card.dart';
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
    'assets/banner1.png',
    'assets/banner2.png',
    'assets/banner3.png',
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
            const SizedBox(height: 10),

            _buildPickupAndDelivery(),

            SizedBox(
              height: 10,
            ),

            _buildAnnouncementsSection()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_drink), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Account'),
          ]),
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
                    ? Colors.orange
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
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .black, // Optional: color to indicate it's clickable
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
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .black, // Optional: color to indicate it's clickable
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
                  backgroundColor: Colors.orange,
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
                      color: Colors.orange,
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
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Pickup',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Delivery',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementsSection() {
    return Padding(
      padding: const EdgeInsets.only(top:10 , left: 20, right: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for Announcements title and the first Announcement Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Announcements",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                child: Text(
                  "See All",
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
                onTap: () => {},
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Display the first announcement card near the title
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: AnnouncementCard(
              imageUrl: announcements[0]["imageUrl"]!,
              title: announcements[0]["title"]!,
              subtitle: announcements[0]["subtitle"],
              onOrderPressed: () {},
            ),
          ),

          // List of additional announcement cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                announcements.length - 1, // Exclude the first announcement
            itemBuilder: (context, index) {
              final announcement =
                  announcements[index + 1]; // Start from the second item
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AnnouncementCard(
                  imageUrl: announcement["imageUrl"]!,
                  title: announcement["title"]!,
                  subtitle: announcement["subtitle"],
                  onOrderPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
