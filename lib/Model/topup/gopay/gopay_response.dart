class ResGopayModel {
  String? timestamp;
  String? code;
  String? message;
  Data? data;

  ResGopayModel({
    this.timestamp,
    this.code,
    this.message,
    this.data,
  });

  ResGopayModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  List<Actions>? actions;
  String? orderId;

  Data({this.status, this.actions, this.orderId});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(Actions.fromJson(v));
      });
    }
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (actions != null) {
      data['actions'] = actions!.map((v) => v.toJson()).toList();
    }
    data['order_id'] = orderId;
    return data;
  }
}

class Actions {
  String? name;
  String? method;
  String? url;

  Actions({this.name, this.method, this.url});

  Actions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    method = json['method'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['method'] = method;
    data['url'] = url;
    return data;
  }
}
