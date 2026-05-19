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
};

// A handy helper function. Instead of writing the full lookup every time,
// any widget can just call: t('app_title', isAmharic)
String t(String key, bool isAmharic) {
  return translations[key]?[isAmharic ? 'am' : 'en'] ?? key;
}
