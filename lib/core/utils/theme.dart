import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:floward/core/utils/helpers.dart';

class CustomThemes {
  static final appTheme = Theme.of(Get.context!),
      _defaultThemeData = ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        iconTheme: IconThemeData(size: CheckTablet.isDeviceTablet() ? 34 : 24),
        primaryColor: const Color.fromRGBO(66, 103, 178, 1),
        fontFamily: 'Cairo',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(66, 103, 178, 1), //thereby
        ),
      ),
      lightThemeData = _defaultThemeData.copyWith(
        iconTheme: IconThemeData(size: CheckTablet.isDeviceTablet() ? 34 : 24),
        colorScheme: _defaultThemeData.colorScheme.copyWith(
          secondary: const Color.fromRGBO(189, 189, 189, 1),
        ),
      ),
      darkThemeData = _defaultThemeData.copyWith(primaryColor: Colors.black);
}
