class KuotaModel {
  String? code;
  String? message;
  List<Data>? data;

  KuotaModel({this.code, this.message, this.data});

  KuotaModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  int? stock;
  int? providerId;
  int? grossAmount;
  String? providerName;

  Data(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.providerId,
      this.grossAmount,
      this.providerName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    stock = json['stock'];
    providerId = json['provider_id'];
    grossAmount = json['gross_amount'];
    providerName = json['provider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['stock'] = stock;
    data['provider_id'] = providerId;
    data['gross_amount'] = grossAmount;
    data['provider_name'] = providerName;
    return data;
  }
}
