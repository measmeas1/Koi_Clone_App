// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatefulWidget {
  final Map<String, dynamic> announcement;

  const AnnouncementDetailScreen({required this.announcement, Key? key})
      : super(key: key);

  @override
  _AnnouncementDetailScreenState createState() =>
      _AnnouncementDetailScreenState();
}

class _AnnouncementDetailScreenState extends State<AnnouncementDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final announcement = widget.announcement;

    String productName = announcement["product_name"];  // Example: "Yakult Green Tea"
    String price = announcement["price"];  // Example: "\$2.8"
    String imagePath = announcement["image_path"]; 

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(images: announcement["sections"][0]["images"]),
            SizedBox(height: 20),
            _buildTitle(announcement["title"]),
            SizedBox(height: 10),
            _buildSubtitle(announcement["subtitle"]),
            SizedBox(height: 20),
            ..._buildSections(announcement["sections"]),
            
            _buildClickableBox(productName, price, imagePath)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text(
            "NEW PROMOTION",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(
        subtitle,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  List<Widget> _buildSections(List sections) {
    return sections.map<Widget>((section) {
      return Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCombinedSection(section),
            SizedBox(height: 20),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildCombinedSection(Map<String, dynamic> section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section["heading"],
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          section["paragraph"],
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          section["paragraph_2"],
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

Widget _buildClickableBox(String productName, String price, String imagePath) {
  return GestureDetector(
    onTap: () {
      // Handle the tap action if needed
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
                    productName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                ],
              ),
            ),
            Image.asset(imagePath)
          ],
        ),
      ),
    ),
  );
}


// This is now a Stateful widget to manage the image carousel
class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({required this.images, Key? key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int nextPage = _pageController.page?.round() ?? 0;
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
