import 'package:capstone_project/Model/cashout/cashout_model.dart' as cashout;
import 'package:capstone_project/Model/cashout/req_cashout.dart';
import 'package:capstone_project/Model/cashout/res_cashout.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/cashout_service.dart';
import 'package:flutter/cupertino.dart';

class CashoutState extends ChangeNotifier {
  CashoutService cashoutService = CashoutService();
  late List<cashout.Data> _data = [];
  List<cashout.Data> get data => _data;

  StateType stateType = StateType.loading;
  StateType get getStatetype => stateType;

  void changeState(StateType value) {
    stateType = value;
    notifyListeners();
  }

  Future getData() async {
    changeState(StateType.loading);
    try {
      final response = await cashoutService.getCashout();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }

  Future<ResCashout> transaksiCashout(ReqCashout setData) async {
    final response = await cashoutService.payCashout(setData);
    return response;
  }
}
