import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Travel Deals")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _travelCard(
            "Mount Fuji Tour",
            "Experience the beauty of Mount Fuji with a guided trip.",
            "https://upload.wikimedia.org/wikipedia/commons/1/12/Mount_Fuji_from_Hotel_Mt_Fuji_2018_img3.jpg",
            "\$499",
          ),
          const SizedBox(height: 16),
          _travelCard(
            "Paris City Tour",
            "Romantic 5-day trip exploring the Eiffel Tower & Louvre.",
            "https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg",
            "\$899",
          ),
        ],
      ),
    );
  }

  Widget _travelCard(String title, String desc, String imageUrl, String price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(imageUrl, height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(desc, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                    ElevatedButton(onPressed: () {}, child: const Text("Book Now")),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
