import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // NEW: Add data list
  final List<Map<String, dynamic>> _chefSpecials = [
    {
      'title': 'MACHA KHANE HOOO',
      'time': '20 min',
      'rating': '4.9',
      'tag': 'Healthy Choice',
      'tagColor': Colors.green
    },
    {
      'title': 'AYE PO BANAUNE',
      'time': '35 min',
      'rating': '4.8',
      'tag': 'Premium',
      'tagColor': Colors.orange
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFFF7F2E9);
    const Color brandColor = Color(0xFFB84715);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'E-Recipe',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: brandColor,
                    ),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: brandColor,
                    child: const Icon(Icons.person, size: 20, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- Search Bar ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'MOMO KHANE ',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.tune, color: brandColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Category Chips ---
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip('All', isActive: true),
                    const SizedBox(width: 10),
                    _buildChip('Breakfast', isActive: false),
                    const SizedBox(width: 10),
                    _buildChip('Lunch', isActive: false),
                    const SizedBox(width: 10),
                    _buildChip('Dinner', isActive: false),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- Chef's Specials Title ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Chef's Specials",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(color: brandColor, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- NEW: Horizontal ListView Skeleton ---
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _chefSpecials.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 260,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('Card Placeholder')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Category Chips
  Widget _buildChip(String label, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFB84715) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey.shade700,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}