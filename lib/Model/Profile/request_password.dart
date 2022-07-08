class ReqEditPassModel {
  String? password;

  ReqEditPassModel({this.password});

  ReqEditPassModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    return data;
  }
}
