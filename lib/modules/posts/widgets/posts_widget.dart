import 'package:floward/modules/posts/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/components/custom_text.dart';
import '../../../core/utils/theme.dart';

class PostsWidget extends GetView<PostsController> {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          itemCount: controller.posts.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          padding: const EdgeInsets.all(5),
          itemBuilder: (BuildContext context, int index) {
            final post = controller.posts[index];
            return Card(
              elevation: 1,
              shadowColor: CustomThemes.appTheme.primaryColor,
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: post.title,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    CustomText(
                      title: post.body,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
