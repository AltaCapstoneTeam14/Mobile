class ResTransaksiModel {
  String? code;
  String? message;
  Data? data;

  ResTransaksiModel({this.code, this.message, this.data});

  ResTransaksiModel.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? orderId;
  String? productType;
  int? productId;
  int? grossAmount;
  int? coinEarned;

  Data(
      {this.id,
      this.status,
      this.createdAt,
      this.orderId,
      this.productType,
      this.productId,
      this.grossAmount,
      this.coinEarned});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    orderId = json['order_id'];
    productType = json['product_type'];
    productId = json['product_id'];
    grossAmount = json['gross_amount'];
    coinEarned = json['coin_earned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['order_id'] = orderId;
    data['product_type'] = productType;
    data['product_id'] = productId;
    data['gross_amount'] = grossAmount;
    data['coin_earned'] = coinEarned;
    return data;
  }
}
