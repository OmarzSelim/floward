import 'package:floward/models/users_model.dart';
import '../core/api/api_exception.dart';
import '../core/api/api_methods.dart';

class UsersRepository {
  final DefaultApi defaultApi = DefaultApi();
  static final UsersRepository usersRepository = UsersRepository();
  Future<List<UsersModel>> getUsers() async {
    final response = await defaultApi.getData(
      path: 'users',
    );
    if (response.statusCode == 200) {
      return List<UsersModel>.from(
          response.data.map((x) => UsersModel.fromJson(x)));
    } else {
      throw ExceptionApi(code: response.statusCode, message: "");
    }
  }
}
