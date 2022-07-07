import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/topup/gopay/bank_response.dart';
import 'package:capstone_project/Model/topup/payment_request.dart';
import 'package:capstone_project/Model/topup/gopay/gopay_response.dart';
import 'package:capstone_project/Model/topup/topup_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopupService {
  final _dio = Dio();

  Future<TopupModel> getTopup() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$baseUrl/products/topup',
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
        '$baseUrl/transactions/topup/gopay',
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
        '$baseUrl/transactions/topup/bank-transfer',
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
