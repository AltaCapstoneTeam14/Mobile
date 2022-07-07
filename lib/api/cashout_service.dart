import 'package:capstone_project/Model/cashout/cashout_model.dart';
import 'package:capstone_project/Model/cashout/req_cashout.dart';
import 'package:capstone_project/Model/cashout/res_cashout.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashoutService {
  final _dio = Dio();
  final _baseUrl = "http://44.201.153.46:8081/api-dev/v1";

  Future<CashoutModel> getCashout() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$_baseUrl/products/cashout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = CashoutModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ResCashout> payCashout(ReqCashout setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.post(
        '$_baseUrl/transactions/cashout',
        data: {
          "product_id": setData.productId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = ResCashout.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
