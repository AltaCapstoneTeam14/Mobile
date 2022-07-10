import 'package:capstone_project/Model/Daily/daily_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/daily_service.dart';
import 'package:flutter/cupertino.dart';

class DailyState extends ChangeNotifier {
  DailyService dailyService = DailyService();
  late Data _data;
  Data get data => _data;

  StateType stateType = StateType.loading;
  StateType get getStatetype => stateType;

  void changeState(StateType value) {
    stateType = value;
    notifyListeners();
  }

  Future getStatus() async {
    changeState(StateType.loading);
    try {
      final response = await dailyService.getStatus();
      _data = response.data!;
      changeState(StateType.success);
    } catch (e) {
      changeState(StateType.error);
    }
  }

  Future<DailyModel> claimCoin() async {
    final response = await dailyService.claim();
    return response;
  }
}
