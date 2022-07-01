import 'package:floward/modules/posts/controller.dart';
import 'package:get/get.dart';

import '../../modules/home/controller.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy put
    Get.lazyPut(() => UsersController(), fenix: true);
    Get.lazyPut(() => PostsController(), fenix: true);
  }
}
