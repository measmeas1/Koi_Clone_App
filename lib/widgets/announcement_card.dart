import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? price;
  final VoidCallback onOrderPressed;

  const AnnouncementCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.price,
    required this.onOrderPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                if (price != null) ...[
                  const SizedBox(height: 8),
                  Text(price!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: onOrderPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Order"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
