class DailyModel {
  String? code;
  String? message;
  Data? data;

  DailyModel({this.code, this.message, this.data});

  DailyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  String? startDate;
  int? loginCount;
  int? lastLogin;
  int? coinReward;

  Data(
      {this.id,
      this.status,
      this.startDate,
      this.loginCount,
      this.lastLogin,
      this.coinReward});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    startDate = json['start_date'];
    loginCount = json['login_count'];
    lastLogin = json['last_login'];
    coinReward = json['coin_reward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['start_date'] = startDate;
    data['login_count'] = loginCount;
    data['last_login'] = lastLogin;
    data['coin_reward'] = coinReward;
    return data;
  }
}
