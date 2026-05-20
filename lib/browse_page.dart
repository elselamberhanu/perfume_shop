import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'language_provider.dart';
import 'translations.dart';
import 'language_toggle.dart';
import 'app_theme.dart';

// Our perfume data model
class Perfume {
  final String name;
  final String brand;
  final String size;
  final double price;
  final String description;
  final String imagePath;
  final Color accentColor;

  const Perfume({
    required this.name,
    required this.brand,
    required this.size,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.accentColor,
  });
}

// Our list of perfumes - REMOVED 'const' keyword
final List<Perfume> allPerfumes = [
  // Changed from 'const' to 'final'
  Perfume(
    name: 'Shalimar',
    brand: 'Guerlain',
    size: '100ML',
    price: 70.00,
    description:
        'A timeless oriental fragrance. Shalimar opens with fresh citrus top notes, and its heart reveals a rich blend of iris and jasmine, resting on a warm base of vanilla and incense.',
    imagePath: 'assets/images/per1.jpg',
    accentColor: AppColors.shalimarAccent,
  ),
  Perfume(
    name: 'J\'Adore',
    brand: 'Dior',
    size: '100ML',
    price: 85.00,
    description:
        'The absolute femininity of Dior. A floral bouquet of ylang-ylang, Damascus rose and jasmine grandiflorum, J\'Adore captures the essence of modern elegance.',
    imagePath: 'assets/images/per2.jpg',
    accentColor: AppColors.jadoreAccent,
  ),
  Perfume(
    name: 'Chance',
    brand: 'Chanel',
    size: '50ML',
    price: 95.00,
    description:
        'A completely round and luminous fragrance. Fresh and clean with notes of pink pepper, jasmine, patchouli and white musks — Chance is the unexpected Chanel.',
    imagePath: 'assets/images/per3.jpg',
    accentColor: AppColors.chanceAccent,
  ),
  Perfume(
    name: 'Black Opium',
    brand: 'YSL',
    size: '90ML',
    price: 80.00,
    description:
        'The original rock \'n\' roll fragrance. An addictive gourmand scent with black coffee, white flowers and vanilla — bold, edgy and deeply sensual.',
    imagePath: 'assets/images/per4.jpg',
    accentColor: AppColors.blackOpiumAccent,
  ),
  Perfume(
    name: 'Aqua Universalis',
    brand: 'Maison Margiela',
    size: '100ML',
    price: 65.00,
    description:
        'Blur gender boundaries and be unconventionally free with this flowery-vanilla eau de parfum. Clean, fresh and universally wearable.',
    imagePath: 'assets/images/per5.jpg',
    accentColor: AppColors.aquaUniversalisAccent,
  ),
  Perfume(
    name: 'Miss Dior',
    brand: 'Dior',
    size: '50ML',
    price: 75.00,
    description:
        'A declaration of love. Miss Dior blooms with notes of Grasse rose absolute, lily of the valley and patchouli — a chic, romantic fragrance for the modern woman.',
    imagePath: 'assets/images/per6.jpg',
    accentColor: AppColors.missDiorAccent,
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
    final lang = LanguageScope.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.menu, color: AppColors.primaryPurple),
        ),
        title: Text(
          t('app_title', lang.isAmharic),
          style: const TextStyle(
            color: AppColors.primaryPurple,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        actions: [
          const LanguageToggle(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.primaryPurple,
                  size: 24,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryBerry,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryPurple
                          : AppColors.surfaceWhite,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryPurple
                            : AppColors.lightLavender,
                      ),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : AppColors.primaryPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
            child: Text(
              'DISCOVER',
              style: TextStyle(
                color: AppColors.secondaryBerry,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Text(
              t('collections', lang.isAmharic),
              style: const TextStyle(
                color: AppColors.primaryPurple,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ),
          Expanded(
            child: filteredPerfumes.isEmpty
                ? Center(
                    child: Text(
                      t('no_perfumes', lang.isAmharic),
                      style: const TextStyle(color: AppColors.mutedGrayPurple),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.68,
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
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailPage(perfume: perfume),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.5, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOutCubic;
                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [AppTheme.cardShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Container(
                  color: perfume.accentColor.withOpacity(0.1),
                  child: Hero(
                    tag: 'image_${perfume.name}',
                    child: Image.asset(
                      perfume.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    perfume.name,
                    style: const TextStyle(
                      color: AppColors.primaryPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${perfume.brand} • ${perfume.size}',
                    style: const TextStyle(
                      color: AppColors.mutedGrayPurple,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: AppTheme.priceTagDecoration,
                    child: Text(
                      '£${perfume.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: AppColors.primaryPurple,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
