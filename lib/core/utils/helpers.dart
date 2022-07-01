import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

const String domain = "https://my-json-server.typicode.com/SharminSirajudeen/test_resources";

class Assets {
  const Assets();
  static const logo = "assets/images/home_logo.png";
}

class CheckTablet {
  static bool isDeviceTablet() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide > 600 ? true : false;
  }
}

class Arguments {
  static const posts = 'posts';
  static const userImage = 'userImage';
}
