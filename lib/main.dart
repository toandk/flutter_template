// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_template/generated/locales.g.dart';
import 'package:flutter_template/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/routes.dart';
import 'utils/keyboard.dart';

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}

Future<void> main() async {
  await _initApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => GPKeyBoard.hide(),
        child: GetMaterialApp(
          theme: AppThemes.theme(),
          darkTheme: AppThemes.darktheme(),
          themeMode: AppThemes().init(),
          locale: const Locale("vi"),
          fallbackLocale: const Locale("en"),
          translationsKeys: AppTranslation.translations,
          initialRoute: RouterName.notifications,
          debugShowCheckedModeBanner: false,
          getPages: Pages.pages,
        ));
  }
}
