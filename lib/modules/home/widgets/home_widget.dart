import 'package:floward/core/components/custom_image_cache.dart';
import 'package:floward/core/components/custom_text.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:get/get.dart';
import '../controller.dart';

class HomeWidget extends GetView<UsersController> {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Offstage(
            offstage: controller.users.isEmpty,
            child: ListView.separated(
              itemCount: controller.users.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final user = controller.users[index];
                return InkWell(
                  onTap: () => controller.onCardTap(user: user),
                  child: Card(
                    margin: const EdgeInsets.all(2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          CustomCachedImage(
                            imageUrl: user.thumbnailUrl ?? '',
                            placeHolderUrl: user.url ?? '',
                            isImageCircle: true,
                            width: 70,
                            height: 70,
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: user.name,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => CustomText(
                                      title: "<${controller.posts.length}>",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 20)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
