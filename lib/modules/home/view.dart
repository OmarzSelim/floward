import 'package:floward/core/shimmer/home_shimmer.dart';
import 'package:floward/modules/home/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:floward/core/components/custom_appbars.dart';
import 'package:floward/modules/home/controller.dart';

class UsersScreen extends GetView<UsersController> {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoHeightAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: controller.obx(
          (homeData) => const HomeWidget(),
          onLoading: const HomeShimmerLoader(),
        ),
      ),
    );
  }
}
