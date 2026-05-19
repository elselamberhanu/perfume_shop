import 'package:flutter/material.dart';
import 'browse_page.dart';
import 'language_provider.dart';
import 'translations.dart';

class DetailPage extends StatelessWidget {
  final Perfume perfume;
  const DetailPage({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    final lang = LanguageScope.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0F0),
      body: CustomScrollView(
        slivers: [
          // ── TOP HERO SECTION ──
          SliverAppBar(
            expandedHeight: 340,
            pinned: true,
            backgroundColor: perfume.cardColor,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: perfume.cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    // Big perfume icon
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        // clips the image into a circle shape
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(
                            perfume.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      perfume.brand.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      perfume.name.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── BOTTOM DETAILS SECTION ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFDF0F0),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and price row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              perfume.name,
                              style: const TextStyle(
                                color: Color(0xFF5C3D3D),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${perfume.brand} • ${perfume.size}',
                              style: TextStyle(
                                color: const Color(0xFF5C3D3D).withOpacity(0.6),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '£${perfume.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFFB07070),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Scent tags
                    Text(
                      t('scent_profile', lang.isAmharic),
                      style: TextStyle(
                        color: Color(0xFFB07070),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _getScentTags(perfume.name).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: perfume.cardColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: perfume.cardColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: Color(0xFF5C3D3D),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 28),

                    // Description
                    Text(
                      t('description', lang.isAmharic),
                      style: TextStyle(
                        color: Color(0xFFB07070),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      perfume.description,
                      style: TextStyle(
                        color: const Color(0xFF5C3D3D).withOpacity(0.8),
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Size selector
                    Text(
                      t('size', lang.isAmharic),
                      style: TextStyle(
                        color: Color(0xFFB07070),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: ['30ML', '50ML', '100ML'].map((size) {
                        final isSelected = perfume.size == size;
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFB07070)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFB07070).withOpacity(0.4),
                            ),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF5C3D3D),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 40),

                    // Add to basket button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${perfume.name} ${t('added_to_basket', lang.isAmharic)}',
                              ),
                              backgroundColor: const Color(0xFFB07070),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C3D3D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag_outlined, size: 20),
                            SizedBox(width: 10),
                            Text(
                              t('add_to_basket', lang.isAmharic),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getScentTags(String name) {
    switch (name) {
      case 'Shalimar':
        return ['Oriental', 'Vanilla', 'Citrus', 'Incense'];
      case 'J\'Adore':
        return ['Floral', 'Rose', 'Jasmine', 'Feminine'];
      case 'Chance':
        return ['Fresh', 'Clean', 'Patchouli', 'Musks'];
      case 'Black Opium':
        return ['Coffee', 'Gourmand', 'Vanilla', 'Bold'];
      case 'Aqua Universalis':
        return ['Fresh', 'Unisex', 'Clean', 'Light'];
      case 'Miss Dior':
        return ['Rose', 'Romantic', 'Chic', 'Floral'];
      default:
        return ['Elegant', 'Luxury'];
    }
  }
}
