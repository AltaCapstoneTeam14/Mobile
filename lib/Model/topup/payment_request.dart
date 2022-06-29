class PaymentModel {
  int? productId;
  String? transferMethod;

  PaymentModel({
    this.productId,
    this.transferMethod,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    transferMethod = json['transfer_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['transfer_method'] = transferMethod;
    return data;
  }
}
