import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? price;
  final VoidCallback onOrderPressed;
  final VoidCallback onCardPressed; // Added callback for card click

  const AnnouncementCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.price,
    required this.onOrderPressed,
    required this.onCardPressed, // Constructor for card click
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed, // Trigger the onCardPressed callback on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(imageUrl,
                  height: 500, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
                right: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(subtitle,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      if (price != null) ...[
                        const SizedBox(height: 8),
                        Text(price!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                      const SizedBox(height: 12),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: onOrderPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        "Order",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
