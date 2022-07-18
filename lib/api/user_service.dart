import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/Profile/request_password.dart';
import 'package:capstone_project/Model/Profile/request_profile.dart';
import 'package:capstone_project/Model/Profile/response_profile.dart';
import 'package:capstone_project/Model/userdata/history_model.dart';
import 'package:capstone_project/Model/userdata/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final _dio = Dio();

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
        '$baseUrl/users/profile',
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

  Future<HistoryModel> getHistory() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$baseUrl/transaction-history',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = HistoryModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ResProfileModel> editProfile(ReqEditProfileModel setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.put(
        '$baseUrl/users',
        data: {
          "name": setData.name,
          "email": setData.email,
          "phone": setData.phone,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = ResProfileModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ResProfileModel> editPassword(ReqEditPassModel setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.put(
        '$baseUrl/users/password',
        data: {
          "password": setData.password,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = ResProfileModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
