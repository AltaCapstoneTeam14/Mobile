class CashoutModel {
  String? code;
  String? message;
  List<Data>? data;

  CashoutModel({this.code, this.message, this.data});

  CashoutModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? coinAmount;
  int? balanceAmount;

  Data({this.id, this.name, this.coinAmount, this.balanceAmount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coinAmount = json['coin_amount'];
    balanceAmount = json['balance_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coin_amount'] = coinAmount;
    data['balance_amount'] = balanceAmount;
    return data;
  }
}
