import 'package:json_annotation/json_annotation.dart';
part 'LoginResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  late String timestamp;
  late String code;
  late String message;
  Map<String, dynamic>? data;

  LoginResponse({
    required this.timestamp,
    required this.code,
    required this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$LoginResponseFromJson(jsonData);

  static Map<String, dynamic> toJson(LoginResponse loginResponse) =>
      _$LoginResponseToJson(loginResponse);
}
