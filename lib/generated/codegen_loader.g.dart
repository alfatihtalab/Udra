// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "title": "آدرى",
  "home": "الرئيسية",
  "settings": "الضبط",
  "language": "اللغة",
  "dark_mode": "الوضع الليلي",
  "logout": "خروج",
  "guest": "زائر",
  "news": "الأخبار",
  "events_text": "المناسبات",
  "about_us": "عنا",
  "ads_title": "الإعلانات",
  "location": "الموقع",
  "about_udra": "عن آدرى",
  "services": "الخدمات",
  "general": "العامة",
  "students": "الطلاب",
  "kids": "الأطفال",
  "udra_cloud": "سحابة آدرى",
  "special_services": "خدمات متخصصة",
  "contact_us": "إتصل بنا",
  "language_text_en": "الإنجليزية",
  "language_text_ar": "العربية"
};
static const Map<String,dynamic> en = {
  "title": "UDRA",
  "home": "Home",
  "settings": "Settings",
  "language": "Language",
  "dark_mode": "Dark mode",
  "logout": "Logout",
  "guest": "Guest",
  "news": "News",
  "events_text": "Events",
  "about_us": "About us",
  "ads_title": "Advertisement",
  "location": "Location",
  "about_udra": "About UDRA",
  "services": "Services",
  "general": "General",
  "students": "Students",
  "kids": "Kids",
  "udra_cloud": "UDRA Cloud",
  "special_services": "Special Services",
  "contact_us": "Contact us",
  "language_text_en": "English",
  "language_text_ar": "Arabic"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
