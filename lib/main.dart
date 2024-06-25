import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/src/settings_service.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.lazyPut(() => SettingsService());
  ThemeMode themeMode = GetStorage().read('themeMode') ?? ThemeMode.dark;
  String lang = GetStorage().read('lang') ?? "en";
  runApp(
    GetMaterialApp(
      title: 'CONFERENCE',
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      debugShowCheckedModeBanner: false,
      locale: Locale(lang),
      themeMode: themeMode,
      theme: Get.find<SettingsService>().getLightTheme(),
      darkTheme: Get.find<SettingsService>().getDarkTheme(),
    ),
  );
}
