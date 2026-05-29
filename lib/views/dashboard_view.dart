import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

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
                    _buildChip('All', true, brandColor),
                    const SizedBox(width: 10),
                    _buildChip('Breakfast', false, brandColor),
                    const SizedBox(width: 10),
                    _buildChip('Lunch', false, brandColor),
                    const SizedBox(width: 10),
                    _buildChip('Dinner', false, brandColor),
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

              // --- Chef's Specials Cards (HARDCODED - Simple Style) ---
              SizedBox(
                height: 220,
                child: Row(
                  children: [
                    _buildChefCard(
                      title: 'MACHA KHANE HOOO',
                      time: '20 min',
                      rating: '4.9',
                      tag: 'Healthy Choice',
                      tagColor: Colors.green,
                      brandColor: brandColor,
                    ),
                    const SizedBox(width: 16),
                    _buildChefCard(
                      title: 'AYE PO BANAUNE',
                      time: '35 min',
                      rating: '4.8',
                      tag: 'Premium',
                      tagColor: Colors.orange,
                      brandColor: brandColor,
                    ),
                  ],
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
              const SizedBox(height: 32),

              // --- Trending Now ---
              const Text(
                'EASY TOO COOK NOW',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Row 1
              Row(
                children: [
                  Expanded(
                    child: _buildTrendingCard(
                      title: 'TARKARI',
                      time: '12 mins',
                      emoji: '🍲',
                      brandColor: brandColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTrendingCard(
                      title: 'MOMO',
                      time: '25 mins',
                      emoji: '🥟',
                      brandColor: brandColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Row 2
              Row(
                children: [
                  Expanded(
                    child: _buildTrendingCard(
                      title: 'BHAT',
                      time: '15 mins',
                      emoji: '🍚',
                      brandColor: brandColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      // --- Bottom Navigation ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: brandColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  // ✅ Simple helper: Category Chip (just like your LoginView helpers)
  Widget _buildChip(String label, bool isActive, Color brandColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? brandColor : Colors.white,
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

  // ✅ Simple helper: Chef's Card (direct parameters, no Maps)
  Widget _buildChefCard({
    required String title,
    required String time,
    required String rating,
    required String tag,
    required Color tagColor,
    required Color brandColor,
  }) {
    return Container(
      width: 260,
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
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: tagColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.star, size: 14, color: brandColor),
                    Text(' $rating • $time'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Simple helper: Trending Card (direct parameters, no Maps)
  Widget _buildTrendingCard({
    required String title,
    required String time,
    required String emoji,
    required Color brandColor,
  }) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFE0D5C8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 40))),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 12, color: Colors.grey),
                    Text(' $time', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    const Spacer(),
                    Icon(Icons.favorite_border, size: 12, color: Colors.grey),
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