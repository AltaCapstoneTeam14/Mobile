class ReqEditProfileModel {
  String? name;
  String? email;
  String? phone;

  ReqEditProfileModel({this.name, this.email, this.phone});

  ReqEditProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
