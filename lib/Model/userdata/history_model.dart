class HistoryModel {
  String? code;
  String? message;
  List<Data>? data;

  HistoryModel({this.code, this.message, this.data});

  HistoryModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? orderId;
  int? transactionDetailId;
  String? productType;
  int? productHistoryId;
  String? name;
  int? grossAmount;
  String? status;
  String? paymentType;
  String? transferMethod;
  String? createdAt;
  String? dateString;
  Product? product;

  Data(
      {this.id,
      this.userId,
      this.orderId,
      this.transactionDetailId,
      this.productType,
      this.productHistoryId,
      this.name,
      this.grossAmount,
      this.status,
      this.paymentType,
      this.transferMethod,
      this.createdAt,
      this.dateString,
      this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    transactionDetailId = json['transaction_detail_id'];
    productType = json['product_type'];
    productHistoryId = json['product_history_id'];
    name = json['name'];
    grossAmount = json['gross_amount'];
    status = json['status'];
    paymentType = json['payment_type'];
    transferMethod = json['transfer_method'];
    createdAt = json['created_at'];
    dateString = json['date_string'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_id'] = orderId;
    data['transaction_detail_id'] = transactionDetailId;
    data['product_type'] = productType;
    data['product_history_id'] = productHistoryId;
    data['name'] = name;
    data['gross_amount'] = grossAmount;
    data['status'] = status;
    data['payment_type'] = paymentType;
    data['transfer_method'] = transferMethod;
    data['created_at'] = createdAt;
    data['date_string'] = dateString;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? amount;
  String? provider;
  String? description;
  String? phone;
  int? denom;
  int? balanceAmount;

  Product(
      {this.amount,
      this.provider,
      this.description,
      this.phone,
      this.denom,
      this.balanceAmount});

  Product.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    provider = json['provider'];
    description = json['description'];
    phone = json['phone'];
    denom = json['denom'];
    balanceAmount = json['balance_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['provider'] = provider;
    data['description'] = description;
    data['phone'] = phone;
    data['denom'] = denom;
    data['balance_amount'] = balanceAmount;
    return data;
  }
}
