import 'package:capstone_project/Model/userdata/history_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/user_service.dart';
import 'package:flutter/cupertino.dart';

class HistoryState extends ChangeNotifier {
  UserService userService = UserService();
  late List<Data> _data;
  List<Data> get data => _data;

  StateType stateType = StateType.loading;
  StateType get getStatetype => stateType;

  void changeState(StateType value) {
    stateType = value;
    notifyListeners();
  }

  Future getHistory() async {
    changeState(StateType.loading);
    try {
      final response = await userService.getHistory();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }
}
