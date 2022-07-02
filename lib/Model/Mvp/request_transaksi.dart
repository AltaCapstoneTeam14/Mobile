class ReqTransaksiModel {
  int? productId;
  String? phone;

  ReqTransaksiModel({this.productId, this.phone});

  ReqTransaksiModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['phone'] = phone;
    return data;
  }
}
