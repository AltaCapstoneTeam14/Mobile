import 'package:capstone_project/Model/Pulsa/pulsa_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PulsaService {
  final _dio = Dio();
  final _baseUrl = "http://44.201.153.46:8081/api-dev/v1";

  Future<PulsaModel> getPulsa() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$_baseUrl/products/pulsa',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = PulsaModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
