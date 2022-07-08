import 'package:capstone_project/Model/Profile/request_password.dart';
import 'package:capstone_project/Model/Profile/request_profile.dart';
import 'package:capstone_project/Model/Profile/response_profile.dart';
import 'package:capstone_project/Model/userdata/user_model.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/api/user_service.dart';
import 'package:flutter/cupertino.dart';

class ProfileState extends ChangeNotifier {
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

  Future<ResProfileModel> edit(ReqEditProfileModel setData) async {
    final response = await userService.editProfile(setData);
    return response;
  }

  Future<ResProfileModel> changePass(ReqEditPassModel setData) async {
    final response = await userService.editPassword(setData);
    return response;
  }
}
