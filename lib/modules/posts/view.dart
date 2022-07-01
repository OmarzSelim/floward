import 'package:floward/core/components/custom_appbars.dart';
import 'package:floward/core/components/custom_image_cache.dart';
import 'package:floward/modules/posts/controller.dart';
import '../posts/widgets/posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends GetView<PostsController> {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Posts"),
      body: Column(
        children: [
          const SizedBox(height: 10),
          if ((controller.image ?? '').isNotEmpty)
            CustomCachedImage(
              imageUrl: controller.image!,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .2,
              borderRadius: 20,
            ),
          const SizedBox(height: 20),
          const PostsWidget(),
        ],
      ),
    );
  }
}
