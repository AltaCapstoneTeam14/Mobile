import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/Login/Request/login_model.dart';
import 'package:capstone_project/Model/Login/Response/login_response.dart';
import 'package:capstone_project/Model/Register/Request/register_model.dart';
import 'package:capstone_project/Model/Register/Response/register_response.dart';
import 'package:dio/dio.dart';

class AuthService {
  final _dio = Dio();

  Future register(RegisterModel pModel) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/register',
        data: {
          'name': pModel.name,
          'email': pModel.email,
          'password': pModel.password,
          'phone': pModel.phone
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = RegisterResponse.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<LoginResponse?> login(LoginModel lModel) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/login',
        data: {
          'email': lModel.email,
          'password': lModel.password,
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final getData = LoginResponse.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
