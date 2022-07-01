import 'dart:collection';

import 'package:capstone_project/Model/Pulsa/pulsa_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/pulsa_service.dart';
import 'package:flutter/cupertino.dart';

class PulsaState extends ChangeNotifier {
  PulsaService pulsaService = PulsaService();

  String _method = "null";
  String get method => _method;

  late List<Data> _data = [];
  UnmodifiableListView<Data> get data => _method == 'null'
      ? UnmodifiableListView(_data)
      : UnmodifiableListView(_data.where((value) {
          final title = value.providerName!;
          return title.contains(_method);
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
    changeState(StateType.loading);
    try {
      final response = await pulsaService.getPulsa();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }
}
