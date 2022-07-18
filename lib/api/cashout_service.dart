import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/cashout/cashout_model.dart';
import 'package:capstone_project/Model/cashout/req_cashout.dart';
import 'package:capstone_project/Model/cashout/res_cashout.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashoutService {
  final _dio = Dio();

  Future<CashoutModel> getCashout() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$baseUrl/products/cashout',
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
        '$baseUrl/transactions/cashout',
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
