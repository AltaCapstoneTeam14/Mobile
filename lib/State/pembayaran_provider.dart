import 'package:capstone_project/Model/topup/gopay/bank_response.dart';
import 'package:capstone_project/Model/topup/gopay/gopay_response.dart';
import 'package:capstone_project/Model/topup/payment_request.dart';
import 'package:capstone_project/api/topup_service.dart';
import 'package:flutter/cupertino.dart';

class PaymentState extends ChangeNotifier {
  TopupService getService = TopupService();
  String _method = "null";
  String get method => _method;

  addMethod(String setMethod) {
    _method = setMethod;
    notifyListeners();
  }

  Future<ResGopayModel> gopayTopup(PaymentModel setData) async {
    final response = await getService.topupGopay(setData);
    return response;
  }

  Future<ResBankModel> bankTopup(PaymentModel setData) async {
    final response = await getService.topupBank(setData);
    return response;
  }
}
