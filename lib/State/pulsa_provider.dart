import 'dart:collection';
import 'package:capstone_project/Model/Mvp/pulsa_model.dart' as pulsa;
import 'package:capstone_project/Model/Mvp/request_transaksi.dart';
import 'package:capstone_project/Model/Mvp/response_transaksi.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/pulsa_service.dart';
import 'package:flutter/cupertino.dart';

class PulsaState extends ChangeNotifier {
  PulsaService pulsaService = PulsaService();

  String _method = "null";
  String get method => _method;

  late List<pulsa.Data> _data = [];
  UnmodifiableListView<pulsa.Data> get data => _method == 'null'
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
      final response = await pulsaService.getPulsa();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }

  Future<ResTransaksiModel> transaksiPulsa(ReqTransaksiModel setData) async {
    final response = await pulsaService.buyPulsa(setData);
    return response;
  }
}
