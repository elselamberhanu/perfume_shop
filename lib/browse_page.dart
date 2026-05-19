import 'package:flutter/material.dart';
import 'detail_page.dart';

// Our perfume data model
class Perfume {
  final String name;
  final String brand;
  final String size;
  final double price;
  final String description;
  final Color cardColor;
  final IconData icon;

  const Perfume({
    required this.name,
    required this.brand,
    required this.size,
    required this.price,
    required this.description,
    required this.cardColor,
    required this.icon,
  });
}

// Our list of perfumes
const List<Perfume> allPerfumes = [
  Perfume(
    name: 'Shalimar',
    brand: 'Guerlain',
    size: '100ML',
    price: 70.00,
    description:
        'A timeless oriental fragrance. Shalimar opens with fresh citrus top notes, and its heart reveals a rich blend of iris and jasmine, resting on a warm base of vanilla and incense.',
    cardColor: Color(0xFFE8C9C9),
    icon: Icons.spa,
  ),
  Perfume(
    name: 'J\'Adore',
    brand: 'Dior',
    size: '100ML',
    price: 85.00,
    description:
        'The absolute femininity of Dior. A floral bouquet of ylang-ylang, Damascus rose and jasmine grandiflorum, J\'Adore captures the essence of modern elegance.',
    cardColor: Color(0xFFD4B896),
    icon: Icons.local_florist,
  ),
  Perfume(
    name: 'Chance',
    brand: 'Chanel',
    size: '50ML',
    price: 95.00,
    description:
        'A completely round and luminous fragrance. Fresh and clean with notes of pink pepper, jasmine, patchouli and white musks — Chance is the unexpected Chanel.',
    cardColor: Color(0xFFC5B8D4),
    icon: Icons.auto_awesome,
  ),
  Perfume(
    name: 'Black Opium',
    brand: 'YSL',
    size: '90ML',
    price: 80.00,
    description:
        'The original rock \'n\' roll fragrance. An addictive gourmand scent with black coffee, white flowers and vanilla — bold, edgy and deeply sensual.',
    cardColor: Color(0xFF9E8EA0),
    icon: Icons.nightlight_round,
  ),
  Perfume(
    name: 'Aqua Universalis',
    brand: 'Maison Margiela',
    size: '100ML',
    price: 65.00,
    description:
        'Blur gender boundaries and be unconventionally free with this flowery-vanilla eau de parfum. Clean, fresh and universally wearable.',
    cardColor: Color(0xFFB8D4C8),
    icon: Icons.water_drop,
  ),
  Perfume(
    name: 'Miss Dior',
    brand: 'Dior',
    size: '50ML',
    price: 75.00,
    description:
        'A declaration of love. Miss Dior blooms with notes of Grasse rose absolute, lily of the valley and patchouli — a chic, romantic fragrance for the modern woman.',
    cardColor: Color(0xFFE8B8C4),
    icon: Icons.favorite,
  ),
];

const List<String> categories = ['ALL', 'DIOR', 'GUERLAIN', 'CHANEL', 'YSL'];

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  int _selectedCategory = 0;

  List<Perfume> get filteredPerfumes {
    if (_selectedCategory == 0) return allPerfumes;
    final brand = categories[_selectedCategory];
    return allPerfumes.where((p) => p.brand.toUpperCase() == brand).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0F0),
      // ── TOP APP BAR ──
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF0F0),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.menu, color: Color(0xFF5C3D3D)),
        ),
        title: const Text(
          'MAISON DE PARFUM',
          style: TextStyle(
            color: Color(0xFF5C3D3D),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xFF5C3D3D),
                  size: 26,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB07070),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        // ── CATEGORY TABS under the app bar ──
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFB07070)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFFB07070)
                            : const Color(0xFFB07070).withOpacity(0.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF5C3D3D),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),

      // ── BODY: perfume grid ──
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 4),
            child: Text(
              'Featured',
              style: TextStyle(
                color: Color(0xFFB07070),
                fontSize: 13,
                letterSpacing: 1,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Text(
              'Collections',
              style: TextStyle(
                color: Color(0xFF5C3D3D),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: filteredPerfumes.isEmpty
                ? const Center(
                    child: Text(
                      'No perfumes in this category yet.',
                      style: TextStyle(color: Color(0xFF5C3D3D)),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: filteredPerfumes.length,
                    itemBuilder: (context, index) {
                      final perfume = filteredPerfumes[index];
                      return _PerfumeCard(perfume: perfume);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _PerfumeCard extends StatelessWidget {
  final Perfume perfume;
  const _PerfumeCard({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(perfume: perfume)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB07070).withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colored image area
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: perfume.cardColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      perfume.icon,
                      size: 56,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      perfume.brand.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Name and price area
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      perfume.name,
                      style: const TextStyle(
                        color: Color(0xFF5C3D3D),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${perfume.brand} • ${perfume.size}',
                      style: TextStyle(
                        color: const Color(0xFF5C3D3D).withOpacity(0.6),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '£${perfume.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFFB07070),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
