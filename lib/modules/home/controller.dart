import 'package:carousel_slider/carousel_slider.dart';
import 'package:floward/core/utils/helpers.dart';
import 'package:floward/core/utils/routes.dart';
import 'package:floward/models/posts_model.dart';
import 'package:floward/models/users_model.dart';
import 'package:floward/repositories/posts_repositories.dart';
import 'package:floward/repositories/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/api/api_exception.dart';

class UsersController extends GetxController with StateMixin<List<UsersModel>> {
  final CarouselController carouselController = CarouselController();
  final TextEditingController searchTEC = TextEditingController();
  List<UsersModel> users = [];
  RxList<PostsModel> posts = <PostsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getUsers();
    _getPosts();
  }

  Future<void> _getUsers() async {
    try {
      final result = await UsersRepository.usersRepository.getUsers();
      if (result.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        users.clear();
        // using this to remove duplicated items if exist
        for (int i = 0; i < result.length; i++) {
          if (!users.any((user) => user.userId == result[i].userId)) {
            users.add(result[i]);
          }
        }
        change(users, status: RxStatus.success());
      }
    } on ExceptionApi catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> _getPosts() async {
    try {
      final postsResult = await Postsrespository.postsrespository.getPosts();
      posts.clear();
      // using this to remove duplicated items if exist
      for (int i = 0; i < postsResult.length; i++) {
        if (!posts.any((post) => post.id == postsResult[i].id)) {
          posts.add(postsResult[i]);
        }
      }
    } on ExceptionApi catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void onCardTap({required UsersModel user}) {
    Get.toNamed(Routes.postsScreen, arguments: {
      Arguments.posts: posts,
      Arguments.userImage: user.thumbnailUrl,
    });
  }
}
