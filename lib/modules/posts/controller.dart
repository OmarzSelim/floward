import 'package:floward/core/utils/helpers.dart';
import 'package:floward/models/posts_model.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  RxList<PostsModel> posts = <PostsModel>[].obs;
  String? image;
  @override
  void onInit() {
    super.onInit();
    _getPosts();
  }

  void _getPosts() {
    final args = (Get.arguments ?? {}) as Map;
    posts = args[Arguments.posts] ?? [];
    image = args[Arguments.userImage] ?? [];
  }
}
