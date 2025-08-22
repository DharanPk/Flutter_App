import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pro E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 TOP BAR
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Location",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        Text("Bilzen, Tanjungbalai",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=47"), // profile
                    ),
                  ],
                ),
              ),

              // 🔹 SEARCH BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search coffee",
                              border: InputBorder.none),
                        ),
                      ),
                      Icon(Icons.filter_list, color: Colors.brown),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 PROMO BANNER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.unsplash.com/photo-1511920170033-f8396924c348",
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      const Positioned(
                        left: 16,
                        bottom: 16,
                        child: Text("Buy One Get One Free",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 CATEGORY LIST
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCategoryChip("Cappuccino", true),
                    _buildCategoryChip("Macchiato", false),
                    _buildCategoryChip("Latte", false),
                    _buildCategoryChip("Americano", false),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 FEATURED PRODUCTS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Featured Products",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("See all",
                        style: TextStyle(color: Colors.brown, fontSize: 14)),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 PRODUCT GRID
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.75,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildProductCard("Cappuccino", "with Chocolate", "4.8",
                      "\$4.53", "https://images.unsplash.com/photo-1509042239860-f550ce710b93"),
                  _buildProductCard("Latte", "with Milk", "4.6", "\$5.20",
                      "https://images.unsplash.com/photo-1509042239860-f550ce710b93"),
                  _buildProductCard("Macchiato", "Espresso Style", "4.7",
                      "\$4.99", "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085"),
                  _buildProductCard("Americano", "Classic Black", "4.5",
                      "\$3.80", "https://images.unsplash.com/photo-1511920170033-f8396924c348"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // CATEGORY CHIP
  Widget _buildCategoryChip(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.brown : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: TextStyle(
              color: selected ? Colors.white : Colors.black, fontSize: 14)),
    );
  }

  // PRODUCT CARD
  Widget _buildProductCard(
      String title, String subtitle, String rating, String price, String image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(image,
                height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star,
                        color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(rating,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown)),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.add,
                          color: Colors.white, size: 20),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
