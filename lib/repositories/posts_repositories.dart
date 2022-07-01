import 'package:floward/models/posts_model.dart';
import '../core/api/api_exception.dart';
import '../core/api/api_methods.dart';

class Postsrespository {
  final DefaultApi defaultApi = DefaultApi();
  static final Postsrespository postsrespository = Postsrespository();
  Future<List<PostsModel>> getPosts() async {
    final response = await defaultApi.getData(
      path: 'posts',
    );
    if (response.statusCode == 200) {
      return List<PostsModel>.from(
          response.data.map((x) => PostsModel.fromJson(x)));
    } else {
      throw ExceptionApi(code: response.statusCode, message: "");
    }
  }
}
