class ResTransaksiModel {
  String? code;
  String? message;

  ResTransaksiModel({this.code, this.message});

  ResTransaksiModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
