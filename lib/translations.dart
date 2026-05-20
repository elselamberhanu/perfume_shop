// A simple key-value store for all app text in both languages.
// The key is a short code like 'app_title', the value is a map
// with 'en' (English) and 'am' (Amharic) versions.

const Map<String, Map<String, String>> translations = {
  'app_title': {'en': 'MAISON DE PARFUM', 'am': 'የሽቶ ቤት'},
  'featured': {'en': 'Featured', 'am': 'ተለይቶ የቀረበ'},
  'collections': {'en': 'Collections', 'am': 'ስብስቦች'},
  'scent_profile': {'en': 'SCENT PROFILE', 'am': 'የሽቶ መገለጫ'},
  'description': {'en': 'DESCRIPTION', 'am': 'መግለጫ'},
  'size': {'en': 'SIZE', 'am': 'መጠን'},
  'add_to_basket': {'en': 'Add to Basket', 'am': 'ወደ ቅርጫት ጨምር'},
  'added_to_basket': {'en': 'added to basket!', 'am': 'ወደ ቅርጫት ተጨምሯል!'},
  'no_perfumes': {
    'en': 'No perfumes in this category yet.',
    'am': 'በዚህ ምድብ ውስጥ ምንም ሽቶ የለም።',
  },
  // Scent tags translations
  'scent_oriental': {'en': 'Oriental', 'am': 'ምስራቃዊ'},
  'scent_vanilla': {'en': 'Vanilla', 'am': 'ቫኒላ'},
  'scent_citrus': {'en': 'Citrus', 'am': 'ሎሚ'},
  'scent_incense': {'en': 'Incense', 'am': 'ጥናት'},
  'scent_floral': {'en': 'Floral', 'am': 'አበባ'},
  'scent_rose': {'en': 'Rose', 'am': 'ሮዝ'},
  'scent_jasmine': {'en': 'Jasmine', 'am': 'ያስሚን'},
  'scent_feminine': {'en': 'Feminine', 'am': 'ሴታዊ'},
  'scent_fresh': {'en': 'Fresh', 'am': 'ትኩስ'},
  'scent_clean': {'en': 'Clean', 'am': 'ንጹህ'},
  'scent_patchouli': {'en': 'Patchouli', 'am': 'ፓቹሊ'},
  'scent_musks': {'en': 'Musks', 'am': 'ሙስክ'},
  'scent_coffee': {'en': 'Coffee', 'am': 'ቡና'},
  'scent_gourmand': {'en': 'Gourmand', 'am': 'ጣፋጭ'},
  'scent_bold': {'en': 'Bold', 'am': 'ጠንካራ'},
  'scent_unisex': {'en': 'Unisex', 'am': 'ሁለት ጾታ'},
  'scent_light': {'en': 'Light', 'am': 'ቀላል'},
  'scent_romantic': {'en': 'Romantic', 'am': 'ሮማንቲክ'},
  'scent_chic': {'en': 'Chic', 'am': 'ስቲል'},
  'scent_elegant': {'en': 'Elegant', 'am': 'ውብ'},
  'scent_luxury': {'en': 'Luxury', 'am': 'የቅንጦት'},
  'scent_woody': {'en': 'Woody', 'am': 'የእንጨት መዓዛ'},
};

// A handy helper function. Instead of writing the full lookup every time,
// any widget can just call: t('app_title', isAmharic)
String t(String key, bool isAmharic) {
  return translations[key]?[isAmharic ? 'am' : 'en'] ?? key;
}
