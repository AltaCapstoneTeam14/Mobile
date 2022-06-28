import 'package:capstone_project/Api/user_service.dart';
import 'package:capstone_project/Model/userdata/user_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:flutter/cupertino.dart';

class HomeState extends ChangeNotifier {
  UserService userService = UserService();
  late Data _data;
  Data get data => _data;

  StateType stateType = StateType.loading;
  StateType get getStatetype => stateType;

  void changeState(StateType value) {
    stateType = value;
    notifyListeners();
  }

  Future getUser() async {
    changeState(StateType.loading);
    try {
      final response = await userService.getUser();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }
}
