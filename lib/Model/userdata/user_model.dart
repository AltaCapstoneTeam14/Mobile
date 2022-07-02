class UserModel {
  String? code;
  int? status;
  Data? data;

  UserModel({
    this.code,
    this.status,
    this.data,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  Balance? balance;
  Balance? coin;
  String? createdAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.balance,
      this.coin,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    balance =
        json['balance'] != null ? Balance.fromJson(json['balance']) : null;
    coin = json['coin'] != null ? Balance.fromJson(json['coin']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    if (balance != null) {
      data['balance'] = balance!.toJson();
    }
    if (coin != null) {
      data['coin'] = coin!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}

class Balance {
  int? id;
  int? amount;

  Balance({this.id, this.amount});

  Balance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    return data;
  }
}
