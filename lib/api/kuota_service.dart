import 'package:capstone_project/Constant/base_url.dart';
import 'package:capstone_project/Model/Mvp/kuota_model.dart';
import 'package:capstone_project/Model/Mvp/request_transaksi.dart';
import 'package:capstone_project/Model/Mvp/response_transaksi.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KuotaService {
  final _dio = Dio();

  Future<KuotaModel> getKuota() async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.get(
        '$baseUrl/products/quota',
        options: Options(
          headers: {
            'Authorization': 'Bearer $myToken',
          },
        ),
      );
      final getData = KuotaModel.fromJson(response.data);
      return getData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ResTransaksiModel> buyKuota(ReqTransaksiModel setData) async {
    final pref = await SharedPreferences.getInstance();
    final myToken = pref.getString('authData');
    try {
      Response response = await _dio.post(
        '$baseUrl/transactions/quota',
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
