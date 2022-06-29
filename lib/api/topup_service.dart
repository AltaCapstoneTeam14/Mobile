import 'package:capstone_project/Model/topup/gopay/bank_response.dart';
import 'package:capstone_project/Model/topup/payment_request.dart';
import 'package:capstone_project/Model/topup/gopay/gopay_response.dart';
import 'package:capstone_project/Model/topup/topup_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopupService {
  final _dio = Dio();
  final _baseUrl = "http://44.201.153.46:8081/api-dev/v1";

  Future<TopupModel> getTopup() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$_baseUrl/products/topup',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = TopupModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ResGopayModel> topupGopay(PaymentModel setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.post(
        '$_baseUrl/transactions/topup/gopay',
        data: {
          "product_id": setData.productId,
          "transfer_method": setData.transferMethod,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = ResGopayModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ResBankModel> topupBank(PaymentModel setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.post(
        '$_baseUrl/transactions/topup/bank-transfer',
        data: {
          "product_id": setData.productId,
          "transfer_method": setData.transferMethod,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = ResBankModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
