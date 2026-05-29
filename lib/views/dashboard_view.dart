import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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

              // --- Chef's Specials Cards (FULL UI) ---
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _chefSpecials.length,
                  itemBuilder: (context, index) {
                    final item = _chefSpecials[index];
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE8D9CC),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: const Center(child: Icon(Icons.restaurant, size: 50, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: item['tagColor'],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        item['tag'],
                                        style: const TextStyle(color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(Icons.star, size: 14, color: brandColor),
                                    Text(' ${item['rating']} • ${item['time']}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // --- Promo Banner ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: brandColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PREMIUM LENU HOS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'GET ACCESS TO MORE RECIPES',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: brandColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('GET PREMIUM'),
                    ),
                  ],
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