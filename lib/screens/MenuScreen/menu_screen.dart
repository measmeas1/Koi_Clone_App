// ignore_for_file: prefer_const_constructors

import 'package:assignment/data/data.dart';
import 'package:assignment/screens/MenuScreen/order_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add "Pickup" button below the text
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to KOiMenuScreen when button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GrabMenuScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Pickup',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space between buttons
                  TextButton(
                    onPressed: () {
                      // Navigate to DeliveryScreen when button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),

             SectionTitle(title: ' 👍 BEST SELLERS'),
            MenuList(category: 'Best Sellers'),

            // SOFT SERVE Section
            SectionTitle(title: ' 🍦 SOFT SERVE'),
            MenuList(category: 'Soft Serve'),

            // CHEWY TEA Section
            SectionTitle(title: ' 🧋 CHEWY TEA'),
            MenuList(category: 'Chewy Tea'),

            // MILK TEA Section
            SectionTitle(title: ' 🧋 MILK TEA'),
            MenuList(category: 'Milk Tea'),

            // SIGNATURE MACCHIATO Section
            SectionTitle(title: ' 🥛 SIGNATURE MACCHIATO'),
            MenuList(category: 'Signature Macchiato'),

            // FLAVORED TEA & JUICE Section
            SectionTitle(title: ' 🍹 FLAVORED TEA & JUICE'),
            MenuList(category: 'Flavor Tea and Juice'),

            // HANDMADE CAFE Section
            SectionTitle(title: ' ☕ HANDMADE CAFE'),
            MenuList(category: 'Handmade Cafe'),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        title: Text(
          'M-🧋-E-🍦-N-☕-U',
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          // Add icon and text button on the right
          IconButton(
            icon: Icon(Icons.search), // Icon for research/search
            onPressed: () {
              // Define action when icon is tapped (e.g., navigate to search page)
              print('Search icon tapped');
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                // Define action when "Research" text is tapped (e.g., navigate to search page)
                print('Research tapped');
              },
              child: Text(
                'Search',
                style: TextStyle(color: Colors.black), // White text color
              ),
            ),
          ),
        ],
    );
  }
}



class GrabMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KOI PickUp Menu 🧋'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Coming soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery 🛵'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Coming soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String category;

  const MenuList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Access the list of items based on category
    final List<Map<String, dynamic>> items = announcements
        .where((categoryMap) => categoryMap.containsKey(category))
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.isEmpty ? 0 : items[0][category].length, // Get the length from the first matching category
      itemBuilder: (context, index) {
        final item = items[0][category][index]; // Access the first matching category's items
        final order = item["order"][0];

        return GestureDetector(
          onTap: () {
            // Handle on tap gesture here
            // For example, navigate to the order screen when a menu item is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderScreen(item: item), // Pass the order data to the next screen
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Image.asset(order['image_path'], width: 50, height: 50),
              title: Text(order['product_name'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(order['price']),
              trailing: Icon(Icons.add_shopping_cart),
            ),
          ),
        );
      },
    );
  }
}