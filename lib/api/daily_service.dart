import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/Daily/daily_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyService {
  final _dio = Dio();

  Future<DailyModel> getStatus() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$baseUrl/daily',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = DailyModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<DailyModel> claim() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.post(
        '$baseUrl/daily',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = DailyModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
