import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/Mvp/pulsa_model.dart';
import 'package:capstone_project/Model/Mvp/request_transaksi.dart';
import 'package:capstone_project/Model/Mvp/response_transaksi.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PulsaService {
  final _dio = Dio();

  Future<PulsaModel> getPulsa() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$baseUrl/products/pulsa',
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

  Future<ResTransaksiModel> buyPulsa(ReqTransaksiModel setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.post(
        '$baseUrl/transactions/pulsa',
        data: {
          "product_id": setData.productId,
          "phone": setData.phone,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = ResTransaksiModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
