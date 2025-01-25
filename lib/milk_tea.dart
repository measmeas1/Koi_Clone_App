// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MilkTea extends StatelessWidget {
  const MilkTea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Grass Jelly Milk Tea')),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/grass_jelly_milk_tea.png', // Replace with the actual path to your image
                  height: 200,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Grass Jelly Milk Tea',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'A tea-based beverage that combines milk tea with pieces of grass jelly, providing a unique and refreshing drink with a hint of herbal flavor from the grass jelly.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cup Size',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1 Required',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOption('S', '\$2.3', false),
                  _buildOption('M', '\$3.2', true),
                  _buildOption('L', '\$4', false),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sugar Level',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1 Required',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOption('0%', '', false,
                      icon: Icons.water_drop_outlined),
                  _buildOption('25%', '', false,
                      icon: Icons.water_drop_outlined),
                  _buildOption('50%', '', false,
                      icon: Icons.water_drop_outlined),
                  _buildOption('70%', '', true,
                      icon: Icons.water_drop_outlined),
                ],
              ),
              Row(
                children: [
                  _buildOption('100%', '', false,
                      icon: Icons.water_drop_outlined),
                  _buildOption('120%', '', false,
                      icon: Icons.water_drop_outlined),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ice Level',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1 Required',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOption('No Ice', '', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Less Ice', '', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Normal Ice', '', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('More Ice', '', false,
                      icon: Icons.icecream_outlined),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Topping',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOption('Konjac Jelly ', '+0.1', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Konjac Ball', '+0.1', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Aloe Vera', '+0.1', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Coconut Jell', '+0.1', false,
                      icon: Icons.icecream_outlined),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Topping Level',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOption('Topping ', '', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Less Topping', '', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('Normal Topping', '', false,
                      icon: Icons.icecream_outlined),
                  _buildOption('More Topping', '', false,
                      icon: Icons.icecream_outlined),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Frequently Bought Together',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFrequentlyBoughtItem(
                        'assets/photo_2025-01-20_15-03-03.jpg',
                        'Jumbo Milk Tea',
                        '\$2.3'),
                    SizedBox(width: 16),
                    _buildFrequentlyBoughtItem(
                        'assets/photo_2025-01-20_15-03-03.jpg',
                        'Golden Milk Tea',
                        '\$2.3'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$3.2',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50),
                  
                ),
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String title, String subtitle, bool isSelected,
      {IconData? icon}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 24,
                color: isSelected ? Colors.orange : Colors.grey,
              ),
          ],
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
        if (subtitle.isNotEmpty) SizedBox(height: 4),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }

  Widget _buildFrequentlyBoughtItem(
      String imagePath, String title, String price) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 100,
          width: 100,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          price,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
