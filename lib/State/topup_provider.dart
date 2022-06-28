import 'package:capstone_project/Model/topup/topup_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/topup_service.dart';
import 'package:flutter/cupertino.dart';

class TopupState extends ChangeNotifier {
  TopupService userService = TopupService();
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
      final response = await userService.getTopup();
      _data = response.data!;
      // notifyListeners();
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }
}
