import 'package:floward/modules/home/view.dart';
import 'package:floward/modules/posts/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  const Routes();
  static const usersScreen = '/', postsScreen = '/postsScreen';
  static const instance = Routes();

  List<GetPage<Widget>> getScreens() {
    return <GetPage<Widget>>[
      GetPage(name: usersScreen, page: () => const UsersScreen()),
      GetPage(name: postsScreen, page: () => const PostsScreen()),
    ];
  }
}
