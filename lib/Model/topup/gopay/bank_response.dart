class ResBankModel {
  String? timestamp;
  String? code;
  String? message;
  Data? data;

  ResBankModel({
    this.timestamp,
    this.code,
    this.message,
    this.data,
  });

  ResBankModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? bank;
  String? status;
  String? orderId;
  String? vaNumber;

  Data({this.bank, this.status, this.orderId, this.vaNumber});

  Data.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    status = json['status'];
    orderId = json['order_id'];
    vaNumber = json['va_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank'] = bank;
    data['status'] = status;
    data['order_id'] = orderId;
    data['va_number'] = vaNumber;
    return data;
  }
}
