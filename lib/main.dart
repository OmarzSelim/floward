import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/utils/initial_binding.dart';
import 'core/utils/routes.dart';
import 'core/utils/helpers.dart';
import 'core/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const FlowardApp());
}

class FlowardApp extends StatelessWidget {
  const FlowardApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      supportedLocales: const [Locale("en"), Locale("ar")],
      scaffoldMessengerKey: scaffoldMessengerKey,
      locale: const Locale("en"),
      fallbackLocale: const Locale("en"),
      popGesture: Get.isPopGestureEnable,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: "Floward",
      theme: CustomThemes.lightThemeData,
      initialBinding: InitialBinding(),
      getPages: Routes.instance.getScreens(),
    );
  }
}
