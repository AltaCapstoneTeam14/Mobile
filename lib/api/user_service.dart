import 'package:capstone_project/Model/userdata/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final _dio = Dio();
  final _baseUrl = "http://44.201.153.46:8081/api-dev/v1";

  UserService() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      if (e.response!.statusCode == 401) {
        final pref = await SharedPreferences.getInstance();
        pref.clear();
      }
      return handler.resolve(e.response!);
    }));
  }

  Future<UserModel> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$_baseUrl/users/profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = UserModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
