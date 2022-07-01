import 'package:capstone_project/Model/Operator/operator_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/operator_service.dart';
import 'package:flutter/cupertino.dart';

class OperatorState extends ChangeNotifier {
  OperatorService operatorState = OperatorService();
  late List<Data> _data = [];
  List<Data> get data => _data;

  StateType stateType = StateType.loading;
  StateType get getStatetype => stateType;

  void changeState(StateType value) {
    stateType = value;
    notifyListeners();
  }

  Future getData() async {
    changeState(StateType.loading);
    try {
      final response = await operatorState.getOperator();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }
}
