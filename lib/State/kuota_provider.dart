import 'dart:collection';
import 'package:capstone_project/Model/Mvp/kuota_model.dart' as kuota;
import 'package:capstone_project/Model/Mvp/request_transaksi.dart';
import 'package:capstone_project/Model/Mvp/response_transaksi.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/kuota_service.dart';
import 'package:flutter/cupertino.dart';

class KuotaState extends ChangeNotifier {
  KuotaService kuotaService = KuotaService();

  String _method = "null";
  String get method => _method;

  late List<kuota.Data> _data = [];
  UnmodifiableListView<kuota.Data> get data => _method == 'null'
      ? UnmodifiableListView(_data)
      : UnmodifiableListView(_data.where((value) {
          final title = value.providerName!;
          final stock = value.stock! > 0;
          return title.contains(_method) && stock;
        }));

  StateType stateType = StateType.loading;
  StateType get getStatetype => stateType;

  void changeState(StateType value) {
    stateType = value;
    notifyListeners();
  }

  addMethod(String setMethod) {
    _method = setMethod;
    notifyListeners();
  }

  Future getData() async {
    try {
      final response = await kuotaService.getKuota();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }

  Future<ResTransaksiModel> transaksiPulsa(ReqTransaksiModel setData) async {
    final response = await kuotaService.buyKuota(setData);
    return response;
  }
}
