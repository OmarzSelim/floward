import 'package:floward/core/components/custom_text.dart';
import 'package:flutter/material.dart';

class NoHeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoHeightAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    this.title = '',
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: CustomText(
        title: title,
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
