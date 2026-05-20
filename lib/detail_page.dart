import 'package:flutter/material.dart';
import 'browse_page.dart';
import 'language_provider.dart';
import 'translations.dart';
import 'language_toggle.dart';
import 'app_theme.dart';

class DetailPage extends StatelessWidget {
  final Perfume perfume;
  const DetailPage({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    final lang = LanguageScope.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 340,
            pinned: true,
            backgroundColor: AppColors.backgroundLight,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.surfaceWhite,
                  shape: BoxShape.circle,
                  boxShadow: [AppTheme.circleShadow],
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryPurple,
                ),
              ),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: LanguageToggle(),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.surfaceWhite,
                  shape: BoxShape.circle,
                  boxShadow: [AppTheme.circleShadow],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: AppColors.secondaryBerry,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.backgroundGradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceWhite,
                        shape: BoxShape.circle,
                        boxShadow: [AppTheme.largeCircleShadow],
                      ),
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Hero(
                            tag: 'image_${perfume.name}',
                            child: Image.asset(
                              perfume.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        perfume.brand.toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.primaryPurple,
                          fontSize: 10,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      perfume.name,
                      style: const TextStyle(
                        color: AppColors.primaryPurple,
                        fontSize: 26,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                color: AppColors.primaryPurple,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${perfume.brand} • ${perfume.size}',
                              style: const TextStyle(
                                color: AppColors.mutedGrayPurple,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: AppTheme.priceTagDecoration,
                          child: Text(
                            '£${perfume.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: AppColors.primaryPurple,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'SCENT PROFILE',
                      style: TextStyle(
                        color: AppColors.secondaryBerry,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _getScentTags(perfume.name, lang.isAmharic).map(
                        (tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: AppTheme.tagDecoration,
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: AppColors.primaryPurple,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'DESCRIPTION',
                      style: TextStyle(
                        color: AppColors.secondaryBerry,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      perfume.description,
                      style: const TextStyle(
                        color: AppColors.mutedGrayPurple,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      'SIZE',
                      style: TextStyle(
                        color: AppColors.secondaryBerry,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: ['30ML', '50ML', '100ML'].map((size) {
                        final isSelected = perfume.size == size;
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: isSelected
                              ? AppTheme.sizeButtonDecorationSelected
                              : AppTheme.sizeButtonDecorationUnselected,
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.primaryPurple,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${perfume.name} ${t('added_to_basket', lang.isAmharic)}',
                              ),
                              backgroundColor: AppColors.primaryPurple,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.shopping_bag_outlined, size: 18),
                            const SizedBox(width: 10),
                            Text(
                              t('add_to_basket', lang.isAmharic),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.8,
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

  List<String> _getScentTags(String name, bool isAmharic) {
    return [
      t('scent_floral', isAmharic),
      t('scent_fresh', isAmharic),
      t('scent_woody', isAmharic),
      t('scent_vanilla', isAmharic),
    ];
  }
}
